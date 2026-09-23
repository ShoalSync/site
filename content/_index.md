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

Deleted files go to a recycle bin and are kept for as long as you choose. Restore them from the
command line or from a browser.

## The web interface is just another peer

Turn on the web peer on any always-on device to sign in from a browser, browse and download
files, and restore deleted ones.

## Open source

Tidefell is written in Rust on [iroh](https://github.com/n0-computer/iroh), which connects
peers directly over QUIC with hole punching and relay fallback. It is licensed under the AGPL,
with the protocol and client SDK under MIT or Apache-2.0 so anyone can build compatible
clients.
