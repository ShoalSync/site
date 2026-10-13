+++
title = "Tidefell 0.17: hard to break"
date = 2026-10-13
description = "A drive that goes away no longer looks like every file deleted, a full disk stops downloads before it fills, a mistaken mass delete waits for you, large folders take far less memory, and simulation testing found and fixed thirteen bugs."
+++

Tidefell 0.17 is about what happens when things go wrong around it: drives that come and go,
disks that fill, a mistaken delete, very large folders, and the timing of many devices at once.

- **A missing drive is not a mass delete.** Each folder's directory holds a small
  `.tidefell/folder` file. If it is missing, as when the drive is not mounted, the folder is
  *unavailable*: nothing is scanned, written or deleted there until the drive is back, and the
  status says why. [Folders on removable drives](/docs/latest/guide/folders.html#folders-on-removable-or-network-drives)
- **Deleting most of a folder waits for you.** A scan that finds most of a folder deleted sends
  none of it until you confirm, or bring the files back from your other devices:
  `tidefell folder deletes`, the web page or the app.
  [Many files deleted at once](/docs/latest/guide/folders.html#many-files-deleted-at-once)
- **A full disk stops downloads, not syncing.** Tidefell keeps some of each drive free
  (`min_free_space`, 2% up to 1 GiB by default). Below it, downloads wait while changes made
  there are still sent, and the status says what is using the space.
- **Errors that last are told apart.** A file that cannot be read because of its permissions,
  or a name the drive refuses, is tried again when something changes or you ask, rather than on
  every pass: `tidefell problems <folder id> --retry`, or "Try again" in the app.
  [Status and problems](/docs/latest/guide/troubleshooting.html#status-and-problems)
- **Large folders take far less memory.** A million files and 10 TiB take 444 MB; a phone folder
  of 50,000 photos takes 40 MB. A nightly job keeps it that way.
- **Simulation testing.** Each change now runs three devices through hundreds of random
  sequences of edits, renames, deletes, partitions, restarts, clock jumps, full disks and lost
  metadata, on a simulated network, and every night through 10,000 more. It found thirteen bugs
  in how devices agree, each a rare race, all fixed; the last two only showed up once in
  10,000 runs.

Nothing to do when updating: the metadata format and the protocol are unchanged, and devices on
0.16 and 0.17 sync with each other.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
