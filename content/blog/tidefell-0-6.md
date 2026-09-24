+++
title = "Tidefell 0.6: always-on peers, uploads and share links"
date = 2026-09-24
description = "Run an always-on peer on your own server, upload files and share links from the web peer, and choose how long each device keeps deleted files."
+++

Tidefell 0.6 makes it easier to keep devices in sync when they are rarely online together, and
to share files with people who do not run Tidefell.

- **Always-on peers.** A NAS at home already keeps every device in sync. Without one, run
  `tidefelld` on a small server you control as a full replica that is always online; your
  devices sync with it whenever they are awake. A NixOS role sets it up with the web peer behind
  HTTPS and, optionally, your own relay. The project still runs no storage service:
  [read the guide](/docs/latest/guide/always-on.html).
- **Uploads.** Web accounts can now upload files, not just download them.
- **Share links.** Share a file or folder with anyone through a read-only link, with an optional
  password, expiry date and download limit. Links are off until the host turns them on:
  [see how](/docs/latest/guide/web.html#share-links).
- **Per-device retention.** Each device decides how long it keeps deleted files, with
  `tidefell folder retention`, and can empty its own recycle bin with `tidefell recycle empty`.
  Other devices keep their copies: [the recycle bin](/docs/latest/guide/recycle-bin.html).

Tidefell is still early: formats may change between releases.
