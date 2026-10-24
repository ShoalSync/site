# Shoal website

Shoal Sync, formerly Tidefell.

Source for the Shoal website and blog, built with
[Zola](https://www.getzola.org/). The documentation under `/docs/` is not written here: it is
the mdBook of the monorepo release pinned by the `shoal` input in [`flake.nix`](flake.nix),
built from that release's source and served at `/docs/<version>/` and `/docs/latest/` (ADR 0013
in the monorepo).

## Building

Nix fetches the pinned monorepo release from GitHub (`ShoalSync/shoal`).

```sh
nix build             # the whole site, docs included, in result/
nix flake check       # shell, Nix and spelling checks, and the site's internal links

# To work on the site, put the pinned docs in static/docs/ and serve it:
nix develop
scripts/docs.sh
zola serve            # http://127.0.0.1:1111
# Or serve a book built in a monorepo checkout (mdbook build docs):
#   scripts/docs.sh ../shoal/docs/book 0.22.0-dev
```

## Deployment

Each push to `main` deploys the site to GitHub Pages, at <https://shoalsync.github.io/site/>
until the site has its own domain (`.github/workflows/pages.yml`, which builds `.#site-pages`).
CI also uploads the built site as the `site` artifact of each run.

## Updating the docs

Bump the tag in the `shoal` input's URL and run `nix flake lock`.

## Layout

| Path | Contents |
| --- | --- |
| `content/` | Landing page and blog posts (Markdown) |
| `templates/` | Tera templates |
| `static/` | Stylesheet; `static/docs/` is generated, not committed |
| `scripts/docs.sh` | Puts the pinned (or a given) book into `static/docs/` |

## Conventions

Read [CONVENTIONS.md](CONVENTIONS.md) before making changes.

## License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or
  <https://www.apache.org/licenses/LICENSE-2.0>)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or <https://opensource.org/licenses/MIT>)

at your option.

All earlier versions of this code, including commits made under the name Tidefell, are also
available under MIT OR Apache-2.0.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in
the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without
any additional terms or conditions.
