+++
title = "Tidefell 0.21: taking back what a lost device changed"
date = 2026-10-17
description = "Changes are accepted only from your own devices, a lost device's later changes can be withdrawn, and home IPv6 counts as local."
+++

Tidefell 0.20 let you cut a lost or stolen device off. 0.21 finishes the job: it deals with what
that device changed.

- **Only your devices' changes.** A device now applies a change only if it was made by one of
  its own devices, or by a device that a current member of the folder has certified and not
  revoked. A change from anyone else is refused. Files already made by a device that is no
  longer vouched for are not deleted: a device that has them takes them over as its own.
- **When was it lost?** If you know when a device was lost, say so when you revoke it:
  `tidefell device revoke <device> --lost-at "2026-10-16 14:30"`, or the date and time on the web
  peer's revoke page. Each of your devices then withdraws what the lost device changed after that
  time, judging by when it received each change, by its own clock. Where a change replaced an
  earlier version, that version comes back; otherwise the file goes to the recycle bin.
  - **See it first.** Before revoking, Tidefell lists what would be withdrawn on that device.
  - **Limits.** The time reaches back no further than the folder's recycle bin keeps files, or
    30 days if it keeps them forever. When a lot of files would be withdrawn at once, nothing
    happens until you decide, with `tidefell folder withdrawals` or on the web peer's folder
    page. A device is revoked only once, so give the time then.
  - Without a time, everything the device made stays, as in 0.20.
- **Home IPv6 is local.** A direct connection over your home network's IPv6 addresses now counts
  as local, as private addresses always did, both in the transfer counts and for speed limits
  that leave local transfers alone.
- **Fixes.** Several cases where one device kept a lost device's version of a file while the
  others had moved on, found by the simulation.

Nothing to do when updating: devices on 0.20 and 0.21 sync with each other, and 0.21 reads
0.20's data as it is. A device still on 0.20 accepts every change as before, so update all your
devices to get the new protection everywhere.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
