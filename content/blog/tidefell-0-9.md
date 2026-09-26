+++
title = "Tidefell 0.9: choose how each folder syncs on each device"
date = 2026-09-26
description = "Send-only folders, deletes that stay on one device, and freeing space on a device without deleting anything elsewhere."
+++

Tidefell 0.9 lets each device decide how it takes part in a folder. The settings are per device:
the other devices keep their own.

- **Send-only folders.** A device can send its new and changed files without ever writing other
  devices' changes to its disk. Nothing is downloaded, and edits and deletes made elsewhere leave
  its files alone: [send-only folders](/docs/latest/guide/folders.html#send-only-folders-and-deletes-that-stay-on-one-device)
- **Deletes that stay on one device.** With `--local-deletes this-device`, a file deleted on that
  device, by any program, disappears from it only. It stays on every other device and is not
  downloaded again until you fetch it. Deleting a file everywhere is then something you ask for
  explicitly.
- **Free space without deleting anything elsewhere.** `tidefell remove-here` moves a file into
  that device's recycle bin, marked as removed here. It stays on every other device, and restoring
  it puts it back on that device only.
- **Two files, one name.** A device that creates a file where another device already has a
  different one, but never downloaded it, now keeps both instead of replacing the other.

These are the foundations for the next Android release, where any folder on the phone, the
camera folder included, can be backed up, synced both ways, or backed up and then removed from the
phone.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
