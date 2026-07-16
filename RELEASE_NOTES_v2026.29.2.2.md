# ALTOVPN-WG V.2026.29.2.2 Beta

## Highlights

- Refactors the shared Main window to React 19 and preserves usability down to the protected `920 x 680` minimum.
- Shows CIDR compatibility for every selected profile. A real overlap blocks Connect, identifies both CIDRs, and presents a copyable gateway NAT plan.
- Refreshes active local IPv4 networks after adapter/address changes and immediately before connection.
- Persists timed Auto Disconnect deadlines in the LocalSystem helper so normal app exit cannot silently remove the timer.

## Security

- Schedule state is restricted to LocalSystem and Administrators.
- Normal schedule commands cannot move deadlines later; only one fixed one-hour extension is accepted per tunnel session.
- Active tunnels prevent schedule cancellation and Auto Disconnect policy changes.
- Privileged helper commands accept only the installed `ALTOVPN-WG.exe` beside the helper; health/status probes remain available.

## Installation

- Beta updater target: `ALTOVPN-WG-V.2026.29.2.2-win-x64-setup.exe`.
- Full Setup contains App `V.2026.29.2.2`, Helper `V.2026.29.2.2`, and official WireGuard for Windows `amd64 1.1`.
- Installation is blocked while any WireGuard tunnel is active.
- Stable remains `V.2026.29.2.1` during Beta observation.

## Gateway NAT requirement

The client proposes a translated CIDR but does not implement transparent client-side whole-subnet NETMAP. The WireGuard endpoint or site gateway must translate the proposed CIDR to the real destination and provide forwarding/return traffic.
