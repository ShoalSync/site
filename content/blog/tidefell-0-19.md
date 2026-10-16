+++
title = "Tidefell 0.19: a smaller release"
date = 2026-10-16
description = "A networking library update, the Android app's own log alongside the engine's, and what the slow emulator backup turned out to be."
+++

Tidefell 0.19 is a small release between two larger pieces of work.

- **Networking update.** iroh, the library that connects your devices, moves to 1.3. Nothing
  changes in how devices find each other or what they send.
- **The Android app's own log.** What the app does (starting and stopping, background syncs,
  what you asked it to do, anything that failed) now goes into the same log files as the engine's,
  so a diagnostics bundle shows both sides of a problem. Keys, pairing codes and file contents
  are never logged.
- **The slow backup, explained.** 0.18's battery figures came with one oddity: backing up a
  gigabyte on the Android emulator took 23 minutes. It turned out not to be the phone's doing.
  The phone found the photos within a second and sent its list at once; the messages then sat in
  the emulator's network connection for minutes. The same setup on real networking, a phone
  behind a home router with no way in from outside, backs up 200 MB in 15 seconds directly and
  35 through a relay, and a test now keeps it so. Whether any real phone is affected needs a run
  on one.

Nothing to do when updating: the metadata format and the protocol are unchanged, and devices on
0.18 and 0.19 sync with each other.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
