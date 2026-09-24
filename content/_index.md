+++
title = "Tidefell"
template = "index.html"
+++

Tidefell keeps your files in sync across your devices, like Dropbox, OneDrive or Nextcloud, but
with no central server. Every device is a peer, and your files live only on the machines you
choose.

## Every device is a peer

A NAS or home server can keep a full copy of everything. Laptops and phones keep what they
need and fetch the rest on demand.

## Swarm downloads

Files are split into content-defined chunks and downloaded from several peers at once. Every
chunk is checked against its BLAKE3 hash before it is used.

## Deletes are recoverable

Deleted files go to a recycle bin and are kept for as long as you choose, set per device: a
phone can keep them for a week while the NAS keeps them forever. Restore them from the command
line or from a browser.

## The web interface is just another peer

Turn on the web peer on any always-on device to sign in from a browser, browse, upload and
download files, and restore deleted ones. Share a file or folder with a read-only link, optionally
with a password, an expiry date or a download limit.

## Always online, on your own terms

Devices that are rarely awake together still sync through an always-on peer: a NAS at home, or
a small server you run yourself. It is your machine, and the project runs no storage service.

## Open source

Tidefell is written in Rust on [iroh](https://github.com/n0-computer/iroh), which connects
peers directly over QUIC with hole punching and relay fallback. It is licensed under the AGPL,
with the protocol and client SDK under MIT or Apache-2.0 so anyone can build compatible
clients.
