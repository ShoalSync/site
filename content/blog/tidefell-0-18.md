+++
title = "Tidefell 0.18: what it protects, and what it costs"
date = 2026-10-14
description = "A threat model for everything Tidefell protects, a plan for cutting off a lost phone, the Android device key sealed by the Keystore, and the app's first battery figures."
+++

Tidefell 0.18 is about two questions people ask before trusting a sync app with their files: what
does it protect, and from whom? And what does it cost the phone's battery?

- **A threat model.** One page now says what Tidefell protects (your files, their names, your
  keys and web accounts), from whom (people on the network, relay operators, other members of a
  folder, a lost phone, whoever has a share link, other users of the computer, the software
  supply chain), and what each can and cannot do. It lists what is not protected yet, and what
  will close each gap. [Threat model](/docs/latest/security/threat-model.html)
- **The Android device key is sealed.** The key that identifies your phone to your other devices
  is now sealed with a key held in the Android Keystore, which never leaves it. A copy of the
  app's storage no longer holds a key anyone can use. A key from an earlier version moves in the
  first time the app starts.
- **A plan for a lost phone.** Today the only way to cut off a lost phone is to remove its user
  from every folder. The design for revoking one device is settled: your other devices refuse it
  as soon as they hear, the files it made are kept, and you can give the time you lost it so
  that anything it changed after that is put back. You see the list before anything is removed,
  and large removals wait for you on each device. It ships with the release that checks who
  made each change.
- **Battery, measured.** A benchmark now runs for each release. On the Android emulator, with
  the app running in the background and nothing to sync, Tidefell used 7.4 seconds of processor
  time an hour, with no wake-ups counted. Receiving a gigabyte took 60 seconds of processor time;
  backing one up, 87. Figures from a real phone, with energy use, come next.
- **Numbers for a battery complaint.** The diagnostics bundle the app can share now includes
  how often and how long the app ran, synced and scanned, and how much it moved.

Nothing to do when updating: the metadata format and the protocol are unchanged, and devices on
0.17 and 0.18 sync with each other.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
