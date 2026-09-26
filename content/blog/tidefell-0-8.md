+++
title = "Tidefell 0.8: confirmed copies and a sturdier sync"
date = 2026-09-25
description = "See which files exist only on one device, free space on your phone once photos are safe, and sync large folders reliably."
+++

Tidefell 0.7 and 0.8 are about knowing your files are safe before anything is removed, and about
syncing correctly when devices disagree or folders are large.

- **Confirmed copies (0.7).** Full replicas, such as a NAS or an always-on peer, confirm the
  files they hold. `tidefell files`, `tidefell status` and the web peer mark files that exist only
  on one device, and a partial replica removes a file it made only once a full replica has
  confirmed holding it: [is it safe elsewhere?](/docs/latest/guide/folders.html#is-it-safe-elsewhere)
- **Free space on your phone.** The Android app can offer to remove photos and videos from the
  phone once a full replica confirms holding their backup. It is off by default, and Android
  asks before anything is deleted. A photo edited after its backup is backed up again and is not
  offered until the new copy is confirmed.
- **Edits are not lost.** A change that arrives from another device just before you edit the same
  file is now kept as a conflict copy instead of being overwritten.
- **Files made at the same path.** Two devices that create a file with the same name while apart
  both keep it; every device writes one of them as `name (conflict …)`, the same way.
- **Large folders.** Folders with hundreds of thousands of files sync without stalling, and a
  peer that stops answering no longer holds up the others.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
