+++
title = "Tidefell 0.22: encrypted folders and storage peers"
date = 2026-10-19
description = "Folders that only your devices can read, and servers that keep a copy without being able to read it."
+++

Until now, every device that synced a folder could read it. 0.22 adds encrypted folders, and
storage peers: servers that keep an encrypted folder for you without being able to read it.

- **Encrypted folders.** Make a folder with `tidefell folder create <path> --encrypted`. Its file
  names and contents are encrypted with a key that only your member devices hold. A new device
  gets the key from one of your other devices when it joins, and when you remove a member or
  revoke a device, the folder moves to a new key, so what's added afterwards is out of its reach.
- **Storage peers.** A storage peer is a server, yours or a friend's, that stores an encrypted
  folder it can't read. Your devices sync through it even when they're never online at the same
  time, and a new device can pick up the folder from it. It keeps the newest version of every
  file, keeps replaced ones for the folder's retention period, and stops fetching when it reaches
  the quota you give it. Name it when you create or join the folder (`--storage-peer <device>`),
  and set it up on the server with a `[storage]` section; the guide's "A storage peer"
  page has the details.
- **Counting copies.** A phone frees space only once a file is safely elsewhere. A storage peer's
  copy counts only while another of your devices also holds the folder's key, since the storage
  peer can't give the file back to anyone without it.
- **Signed releases.** Release downloads are signed with the project's release key; the install
  guide shows how to check them.

Plaintext folders work as before, and devices on 0.21 and 0.22 keep syncing them. Every member of
an encrypted folder needs 0.22. Once a device is updated it can't go back to 0.21: its settings
are saved in a newer format.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
