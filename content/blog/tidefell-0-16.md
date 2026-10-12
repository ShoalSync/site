+++
title = "Tidefell 0.16: metadata that survives"
date = 2026-10-12
description = "Each folder's metadata lives in its own database, saves cost what changed rather than the whole folder, it can sit on fast storage, and a damaged or lost database rebuilds just that folder, recycle bin and history included."
+++

Tidefell 0.16 is about the metadata a device keeps for each folder: what every file is, where its
versions came from, what is in the recycle bin. Until now each folder kept it in two files,
written whole on every save. That was fine for a few thousand files and slow for a hundred
thousand, and a damaged file meant starting the folder again by hand.

- **One database per folder.** Saving writes only what changed. At 100,000 files, applying a
  batch of 512 changes from another device writes about half a megabyte and holds up the folder
  for under 5 milliseconds.
- **On fast storage, if you like.** `metadata_dir` puts the databases somewhere else than the
  rest of the data, such as an SSD in a NAS whose files sit on slow disks:
  [configuration](/docs/latest/guide/configuration.html)
- **Damage costs one folder, not the device.** The databases are checked when Tidefell starts,
  every day and by `tidefell doctor`. A damaged or missing one is set aside and that folder is
  rebuilt: the files on disk are matched to what your other devices send, and the recycle bin
  and earlier versions come back from small notes kept beside them. Other folders keep syncing
  meanwhile. `tidefell folder rebuild`, or "Rebuild this folder" in the app, does the same by
  hand: [rebuilding a folder](/docs/latest/guide/folders.html#rebuilding-a-folder)
- **Your choices stay yours.** Pins, sync choices and retention are kept with the device's
  settings, so a rebuild keeps them too.
- **Nothing is lost to a crash.** Changes are written in order and in full; a device stopped in
  the middle of its first sync carries on where it was.

The first start of 0.16 converts each folder's metadata, after which an earlier version cannot
read it, so update a device for good rather than to try it. Devices on 0.15 and 0.16 sync with
each other as before.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
