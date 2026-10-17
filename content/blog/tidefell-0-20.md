+++
title = "Tidefell 0.20: lost devices and signed releases"
date = 2026-10-17
description = "Revoke a lost or stolen device, signed releases built on their own machine, relay tokens, and a round of hardening."
+++

Tidefell 0.20 is mostly about what happens when something goes wrong: a phone is lost, a
password is guessed, a download is tampered with.

- **Revoke a lost device.** On the computer that holds your user key, `tidefell device revoke`
  (or **Revoke…** on the web peer's Status page) cuts a lost or stolen device off. Your devices
  tell each other before they exchange anything else, so the revocation spreads to every device
  that talks to any other, and a revoked device that comes back online is refused and learns it
  is revoked. Files it made stay. The Android app says so if it is the one revoked.
- **Signed releases.** Releases are now built on a machine of their own, only from tags on the
  main branch that passed every check, and each download comes with a Sigstore signature that
  ties it to that build. The install guide shows how to check one with `cosign`.
- **Relay tokens.** A relay you run yourself can admit only your devices: give it a token, and
  give your devices the same token (`token_file`, or the Android app's relay token setting).
- **Hardening.** Tidefell's data directory is now readable by you alone; the web peer slows down
  repeated wrong passwords, per account or share link, up to fifteen minutes; one uploaded file
  is limited to 1 GiB unless you change it, and uploads stop before the disk fills; the NixOS
  service runs with no special privileges and a narrower sandbox.
- **Who vouches for whom.** Devices now fetch and keep each other's certificates, and record
  which device made each change and when it arrived. Nothing is refused on that basis yet: that
  comes in 0.21, once every device can answer, together with telling Tidefell *when* a device
  was lost so the changes made after that are taken back.
- **Fixes.** A file renamed over another of the same size while Tidefell was stopped is no
  longer missed.

Nothing to do when updating: devices on 0.19 and 0.20 sync with each other, and 0.20 reads 0.19's
data as it is.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
