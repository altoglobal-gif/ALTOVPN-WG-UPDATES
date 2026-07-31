#!/usr/bin/env bash
# Usage: curl -fsSL https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/main/install/ubuntu.sh | bash
set -euo pipefail

channel="${ALTOVPN_CHANNEL:-stable}"
case "$channel" in
  stable) manifest_url="https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/main/stable.json" ;;
  beta) manifest_url="https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/beta/beta.json" ;;
  dev) manifest_url="https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/dev/dev.json" ;;
  *) echo "ALTOVPN_CHANNEL must be stable, beta, or dev." >&2; exit 64 ;;
esac

for command in curl python3 openssl sha256sum; do
  command -v "$command" >/dev/null 2>&1 || {
    echo "Required command is missing: $command" >&2
    exit 69
  }
done
if command -v wg >/dev/null 2>&1 && [ -n "$(wg show interfaces)" ]; then
  echo "Disconnect every WireGuard tunnel before installing ALTOVPN-WG." >&2
  exit 75
fi

work="$(mktemp -d "${TMPDIR:-/tmp}/altovpn-wg-bootstrap.XXXXXX")"
cleanup() { rm -rf -- "$work"; }
trap cleanup EXIT INT TERM
manifest="$work/manifest.json"
public_key="$work/ubuntu-update-ed25519-public.pem"
payload="$work/payload"
signature="$work/signature"
metadata="$work/metadata.json"

cat > "$public_key" <<'EOF'
-----BEGIN PUBLIC KEY-----
MCowBQYDK2VwAyEAbfS3wi0cSCUJDSfxUC/q6e1YctKfTEiiTebjgBMrCq0=
-----END PUBLIC KEY-----
EOF
curl --fail --location --proto '=https' --tlsv1.2 --retry 3 \
  --output "$manifest" "$manifest_url"

python3 - "$manifest" "$metadata" "$payload" "$signature" <<'PY'
import base64
import json
import re
import sys
from pathlib import Path
from urllib.parse import urlparse

manifest_path, metadata_path, payload_path, signature_path = map(Path, sys.argv[1:])
manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
version = str(manifest.get("latestVersion", ""))
artifact = manifest.get("ubuntuArtifact")
if not re.fullmatch(r"V\.\d{4}\.\d{1,2}\.\d+\.\d+", version):
    raise SystemExit("Update manifest version is invalid.")
if not isinstance(artifact, dict):
    raise SystemExit("This channel has no Ubuntu package yet.")
if artifact.get("type", "").lower() not in {"deb", "debian-package"}:
    raise SystemExit("Ubuntu artifact type is invalid.")
if artifact.get("platform", "").lower() not in {"ubuntu-all", "ubuntu-x64", "linux-all", "linux-x64"}:
    raise SystemExit("Ubuntu artifact platform is invalid.")
file_name = str(artifact.get("fileName", ""))
match = re.fullmatch(r"altovpn-wg_(\d{4}\.\d{1,2}\.\d+\.\d+)_all\.deb", file_name)
if not match or f"V.{match.group(1)}" != version:
    raise SystemExit("Ubuntu artifact name/version is invalid.")
url = urlparse(str(artifact.get("downloadUrl", "")))
if url.scheme != "https" or url.username or url.password or url.hostname not in {
    "github.com", "objects.githubusercontent.com", "release-assets.githubusercontent.com"
}:
    raise SystemExit("Ubuntu artifact URL is not a trusted GitHub release host.")
sha256 = str(artifact.get("sha256", "")).upper()
size = artifact.get("sizeBytes")
if not re.fullmatch(r"[A-F0-9]{64}", sha256) or not isinstance(size, int) or size < 1:
    raise SystemExit("Ubuntu artifact hash or size is invalid.")
if artifact.get("signatureAlgorithm", "").lower() != "ed25519":
    raise SystemExit("Ubuntu artifact signature algorithm is invalid.")
try:
    signature = base64.b64decode(str(artifact["signature"]), validate=True)
except (KeyError, ValueError) as exc:
    raise SystemExit("Ubuntu artifact signature is invalid.") from exc
if len(signature) != 64:
    raise SystemExit("Ubuntu artifact signature length is invalid.")
payload_path.write_bytes((
    "ALTOVPN-WG-UBUNTU-UPDATE-V1\n"
    f"{version}\n{file_name}\n{size}\n{sha256}\n"
).encode("utf-8"))
signature_path.write_bytes(signature)
metadata_path.write_text(json.dumps({"url": url.geturl(), "fileName": file_name, "size": size, "sha256": sha256}), encoding="utf-8")
PY

openssl pkeyutl -verify -pubin -inkey "$public_key" -rawin \
  -in "$payload" -sigfile "$signature" >/dev/null
url="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["url"])' "$metadata")"
file_name="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["fileName"])' "$metadata")"
expected_size="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["size"])' "$metadata")"
expected_sha="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["sha256"])' "$metadata")"
package="$work/$file_name"
curl --fail --location --proto '=https' --tlsv1.2 --retry 3 --output "$package" "$url"
[ "$(stat -c '%s' "$package")" = "$expected_size" ] || { echo "Ubuntu package size verification failed." >&2; exit 65; }
[ "$(sha256sum "$package" | awk '{print toupper($1)}')" = "$expected_sha" ] || { echo "Ubuntu package SHA256 verification failed." >&2; exit 65; }

sudo apt-get install -y "$package"
echo "ALTOVPN-WG Ubuntu installation completed."
