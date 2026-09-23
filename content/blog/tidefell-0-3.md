+++
title = "Tidefell 0.3: a command line and a web peer"
date = 2026-09-23
description = "Manage folders with the tidefell command, restore deleted files from a browser, and read the new documentation."
+++

Tidefell 0.3 is the first release you can use without editing configuration files.

- **The `tidefell` command** creates, joins and shares folders, lists files, and restores
  deleted files from the recycle bin. It talks to the daemon over a local REST API, which is
  documented with an OpenAPI description attached to every release.
- **The web peer** lets people sign in from a browser to browse and download files and restore
  deleted ones. Accounts are managed on the host with `tidefelld web account`.
- **Documentation** now lives on this site, built from the same release:
  [read it here](/docs/latest/).

Tidefell is still early: formats may change between releases, and partial replicas do not
have placeholders yet.
