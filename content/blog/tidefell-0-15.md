+++
title = "Tidefell 0.15: names every drive can keep"
date = 2026-10-11
description = "Files whose names differ only in case both survive on phones, SD cards, Macs and PCs, names a drive cannot store are listed with a way to rename them, and paths are the same everywhere."
+++

Tidefell 0.15 is about file names. A Linux machine happily keeps `Photo.jpg` and `photo.jpg` as
two files, and names like `notes: draft.txt`. A phone's storage, an SD card, or a Mac or Windows
drive cannot: before, one photo could quietly overwrite the other there, and a name the drive
refused failed on every sync.

- **Each folder knows its drive.** When a folder opens, the device tries a few names in
  `.tidefell/` to learn whether case matters, which characters are refused and how long a name
  may be. `tidefell doctor` shows what it found:
  [checking a device](/docs/latest/guide/troubleshooting.html#checking-a-device)
- **Both files survive.** On a drive that ignores case, `Photo.jpg` and `photo.jpg` are both
  kept, one as `Photo (conflict …).jpg`. Your other devices keep both names, and editing either
  changes it everywhere without renaming it.
- **Names a drive refuses** are listed as on your other devices, with a problem that says why,
  instead of failing on every pass. Rename them everywhere from the app, the web peer, or
  `tidefell rename`:
  [names other drives cannot keep](/docs/latest/guide/folders.html#names-other-drives-cannot-keep)
- **Renaming only the case** of a file, which those drives allow, renames it on every device.
- **One spelling on the wire.** Names are sent in one Unicode form, so a name typed one way and
  stored another is still one file, and keeps the spelling it has on your disk.

Devices on 0.14 and 0.15 sync with each other. A 0.14 device that found a name on disk in an
unusual Unicode form sends it in that form, which 0.15 devices skip until it is renamed or the
device is updated.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
