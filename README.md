# Tidefell website

Source for the Tidefell website and blog, built with
[Zola](https://www.getzola.org/). The documentation under `/docs/` is not written here: it is
the mdBook of the monorepo release pinned by the `tidefell` input in [`flake.nix`](flake.nix),
built from that release's source and served at `/docs/<version>/` and `/docs/latest/` (ADR 0013
in the monorepo).

## Building

The monorepo is private: Nix fetches it over SSH from Forgejo, so building needs a key that can
read `tidefell/tidefell` (CI uses the `TIDEFELL_READ_KEY` deploy key).

```sh
nix build             # the whole site, docs included, in result/
nix flake check       # shell, Nix and spelling checks, and the site's internal links

# To work on the site, put the pinned docs in static/docs/ and serve it:
nix develop
scripts/docs.sh
zola serve            # http://127.0.0.1:1111
# Or serve a book built in a monorepo checkout (mdbook build docs):
#   scripts/docs.sh ../tidefell/docs/book 0.22.0-dev
```

## Deployment

Not set up yet. Until then CI uploads the built site as the `site` artifact of each run.

## Updating the docs

Bump the tag in the `tidefell` input's URL and run `nix flake lock`.

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

Site content is licensed under [Creative Commons Attribution-ShareAlike 4.0](LICENSE)
(`CC-BY-SA-4.0`).
