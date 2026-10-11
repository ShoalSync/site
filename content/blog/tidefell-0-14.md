+++
title = "Tidefell 0.14: many small files, fast"
date = 2026-10-11
description = "Folders of many small files sync over twenty times faster on slow links, with nothing to change on your side."
+++

Tidefell 0.14 is about folders of many small files, such as photos, notes and source code, on
slow or distant links, where each file used to cost three round trips one after another.

- **Several files at once.** A device now fetches and writes up to eight files at a time, while
  still writing changes to the same file or folder in order.
- **Small files in one step.** A file smaller than one chunk is fetched straight away, without
  first asking for its list of chunks.
- **Fewer requests.** Chunks for files fetched at the same time go to each device in one request,
  and a device that holds the whole folder is not asked what it holds first.

Measured between two devices with a tenth of a second added to every request, a thousand files
of 2 KB now sync in 14 seconds instead of 5 minutes, and a 256 MiB file is no slower. Metrics now
also count the requests each device sends, by kind.

This release also adds stricter checks to how Tidefell itself is built and tested, including
nightly fuzzing of everything that arrives from other devices.

Devices on 0.13 and 0.14 sync with each other, and nothing needs upgrading: the protocol is
unchanged.

Tidefell is still early: formats may change between releases. Devices restored from a phone or
computer backup must be paired again.
