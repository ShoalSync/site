+++
title = "Shoal"
template = "index.html"
+++

Shoal keeps your files in sync across your devices, like Dropbox, OneDrive or Nextcloud, but
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

## Know where your files are safe

Every device knows which full replicas, such as a NAS or an always-on peer, have confirmed
holding the files it made, and marks the ones that exist only on it. A phone keeps a file it made
until a full replica has it, and the Android app can offer to remove backed-up photos from the
phone once one does, always through Android's own confirmation.

## The web interface is just another peer

Turn on the web peer on any always-on device to sign in from a browser, browse, upload and
download files, and restore deleted ones. Share a file or folder with a read-only link, optionally
with a password, an expiry date or a download limit.

## Always online, on your own terms

Devices that are rarely awake together still sync through an always-on peer: a NAS at home, or
a small server you run yourself. It is your machine, and the project runs no storage service.

## Open source

Shoal is written in Rust on [iroh](https://github.com/n0-computer/iroh), which connects
peers directly over QUIC with hole punching and relay fallback. All of it is licensed under
MIT or Apache-2.0, at your option, so anyone can use it, build on it and build compatible
clients.
