# Production smoke attestations

A Stable promotion that sets `updatePolicy.touchesHelper: true`, names a Helper
component, or changes `updatePolicy.helperVersion` from the PR base must include:

```text
attestations/<fileVersion>.production-smoke.json
```

The attestation is evidence, not a security bypass. It must bind the exact Stable
version and artifact SHA256 to a full source commit in `altoglobal-gif/ALTOVPN-WG`,
record a real installed-transition smoke with Endpoint EDR enabled, and carry an
explicit approval identity, timestamp, and ticket/change reference.

Required shape:

```json
{
  "schemaVersion": 1,
  "releaseVersion": "V.2026.32.0.2",
  "artifactSha256": "<64 hex characters, matching stable.json>",
  "sourceRepository": "altoglobal-gif/ALTOVPN-WG",
  "sourceCommit": "<full 40-character lowercase commit SHA>",
  "testedAt": "2026-08-06T12:00:00+07:00",
  "results": {
    "installedTransition": true,
    "helperServiceOnline": true,
    "wireGuardConnectDisconnect": true,
    "endpointSecurityAllowed": true,
    "rollbackVerified": true
  },
  "approval": {
    "approved": true,
    "approvedBy": "<named approver>",
    "approvedAt": "2026-08-06T12:15:00+07:00",
    "reference": "<ticket or approved change record>"
  }
}
```

Do not commit an attestation for a smoke that was skipped, declined, or run with
Endpoint EDR disabled. Keep a withdrawn release asset for forensic analysis, but
add its version to `withdrawn-versions.json` so no channel can select it.
