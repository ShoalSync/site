+++
title = "Tidefell 0.11: faster, quieter, and local"
date = 2026-09-27
description = "Changes are noticed within seconds without constant scanning, junk files stay put, and devices on one network find each other without the internet."
+++

Tidefell 0.11 adds three things other sync tools have long had.

- **Changes within seconds.** `tidefelld` now watches your folders instead of rescanning them
  every ten seconds. A change is picked up within a couple of seconds, and only the directory it
  happened in is looked at, so large folders cost almost nothing while idle. A full scan still
  runs once an hour as a safety net. Folders on network filesystems such as NFS or SMB, where
  changes from other machines are never reported, keep scanning on their interval, and
  `tidefell status` says so: [configuration](/docs/latest/guide/configuration.html)
- **Ignore patterns.** A `.tidefellignore` file at a folder's root lists files this device
  neither sends nor receives, in gitignore syntax. It applies to that device only; an
  `#include` line can share a list between devices. Operating-system and temporary files, such
  as `.DS_Store`, `Thumbs.db`, editor swap files and half-finished downloads, are ignored
  everywhere by default. Ignoring a file never deletes it: [ignoring files](/docs/latest/guide/folders.html#ignoring-files)
- **Devices on one network find each other.** Your devices on the same network now connect
  directly, even with no internet connection at all. Discovery only finds devices you have
  already paired; it never adds one. It can be turned off with `network.local_discovery`, and
  in the Android app's settings.

On Android, the new setting is under **Settings → Network**.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
