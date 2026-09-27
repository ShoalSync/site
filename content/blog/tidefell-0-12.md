+++
title = "Tidefell 0.12: nothing lost without asking"
date = 2026-09-27
description = "Earlier versions of your files, conflicts that wait for you to decide, speed limits and pause, files kept on your phone, and upload-only links."
+++

Tidefell 0.12 finishes the features we set out to borrow from other sync tools.

- **Conflicts wait for you.** When two devices change the same file while they cannot reach
  each other, both versions are kept, and every device shows the same one until you decide.
  Until now the other version was lost with the next edit. `tidefell conflicts` lists them,
  `tidefell resolve` keeps one or both, the web marks the file and shows each version side by
  side, and the Android app notifies you. A version you do not keep goes to the recycle bin:
  [conflicts](/docs/latest/guide/folders.html#conflicts)
- **Earlier versions.** When a file is replaced, the device keeps its previous content for the
  recycle bin's retention period. `tidefell history`, the web and the app list and restore them:
  [previous versions](/docs/latest/guide/recycle-bin.html#previous-versions)
- **Speed limits and pause.** Upload and download limits, with devices on your own network left
  at full speed unless you say otherwise, and pause for a folder or the whole device. Pause
  survives restarts: [pausing and limiting](/docs/latest/guide/folders.html#pausing-and-limiting)
- **Keep files on a device.** A phone, or any device that holds only some files, can keep chosen
  files and directories at all times, outside its space budget.
- **Upload-only links.** A share link to a directory can let people send you files without
  seeing what is there, with limits on size and number of files:
  [upload-only links](/docs/latest/guide/web.html#upload-only-links)
- **Drives that go away.** A folder on a removable or network drive that is not mounted is
  shown as unavailable instead of looking empty, so its files are never deleted on your other
  devices.
- **Crash reports.** Logs and crash files are kept on each device, and after a crash the CLI and
  the app tell you and let you share the report.

This release changes the sync protocol and the data format. Update every device; each upgrades
its data when it first starts. A device still on 0.11 syncs with 0.12 devices, but may lose a
conflicting version until it updates.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
