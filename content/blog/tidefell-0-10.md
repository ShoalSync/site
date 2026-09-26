+++
title = "Tidefell 0.10: each file stored once"
date = 2026-09-26
description = "Files take their own size on disk, not twice it, and phones can fetch files that are only on other devices."
+++

Tidefell 0.10 halves the space a synced folder takes.

- **Each file stored once.** Until now every device kept a second copy of each file's content
  in its block store, so a NAS with a terabyte of photos used two. Now the files on disk are the
  content: peers are served straight from them, and every piece is checked against its hash
  before it is sent. The first sync after upgrading removes the old copies.
- **Deleted files are moved, not copied.** A file deleted from another device, or with
  `tidefell delete`, is moved into the folder's `.tidefell/deleted/` directory, so the
  [recycle bin](/docs/latest/guide/recycle-bin.html) takes no more space than the file did.
- **Files on other devices, from the phone.** The next Android release can download a file of a
  phone folder that is only on your other devices, from the app or from Android's file picker.

One trade-off: a file deleted by hand, outside Tidefell, leaves no copy on that device. The other
devices still keep it in their recycle bins. A folder that is on only one device cannot recover
such a file, so add a second device, such as an always-on peer, for folders that matter.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
