+++
title = "Tidefell 0.13: see what it is doing"
date = 2026-09-29
description = "Status and problems per file, a doctor, diagnostics bundles, who changed what, Prometheus metrics, and crash reports you file yourself."
+++

Tidefell 0.13 is about knowing what your devices are doing, and what to do when something is
wrong. Everything it records stays on the device; nothing is sent unless you send it.

- **Status and problems.** `tidefell status` shows each device you sync with, connected
  directly or through a relay, what has moved and how fast, and what each folder is doing. A
  file that cannot be read, fetched, written or deleted is listed, with why, until it works, and
  one bad file no longer holds up the rest:
  [status and problems](/docs/latest/guide/troubleshooting.html#status-and-problems)
- **A doctor.** `tidefell doctor` checks the clock against your other devices, free space,
  folder permissions, watching and the network, and says what to do about anything wrong:
  [checking a device](/docs/latest/guide/troubleshooting.html#checking-a-device)
- **Diagnostics bundles.** `tidefell diagnostics` writes one file with the logs, status,
  problems and checks, with file and folder names hashed, to look at and attach to a report:
  [reporting a problem](/docs/latest/guide/troubleshooting.html#reporting-a-problem)
- **Who changed what.** Every file says which device made its current version, and
  `tidefell activity` lists what each device applied to a folder, and from where:
  [what changed](/docs/latest/guide/troubleshooting.html#what-changed-and-who-changed-it)
- **Metrics.** `tidefelld` can serve Prometheus metrics: content moved, fetch failures,
  connections, and each folder's backlog and problems:
  [metrics](/docs/latest/guide/troubleshooting.html#metrics)
- **Crash reports.** After a crash, `tidefell crashes --report` and the web's status page write
  it up as an issue, with your home directory taken out, for you to read and file:
  [reporting a crash](/docs/latest/guide/troubleshooting.html#reporting-a-crash)

The web peer shows all of this too. The Android app gains its screens in a coming update.

Devices on 0.12 and 0.13 sync with each other, and nothing needs upgrading. Only 0.13 devices
tell each other their clocks, which the doctor uses.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
