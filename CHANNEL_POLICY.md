# Dev → Beta → Stable

- `dev` branch + `dev.json`: all new work starts here.
- `beta` branch + `beta.json`: opt-in Beta users receive an approved Dev artifact.
- `main` branch + `latest.json`/`stable.json`: production Stable.

Promotion reuses the exact same release asset, size, and SHA256. Never rebuild between Dev, Beta, and Stable.

Desktop and helper versions are independent. App-only updates use the existing LocalSystem helper without UAC and contain no helper files. Full setup is allowed only for a genuine helper change or the final missing/unusable helper fallback.
