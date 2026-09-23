# Tidefell website

Source for the [Tidefell](https://github.com/tidefell/tidefell) website and blog, built with
[Zola](https://www.getzola.org/). The documentation under `/docs/` is not written here: it is
the mdBook from the monorepo release pinned in [`TIDEFELL_VERSION`](TIDEFELL_VERSION), served at
`/docs/<version>/` and `/docs/latest/` (ADR 0013 in the monorepo).

## Building

With Nix, `nix develop` provides `zola` and `gh`.

```sh
# Download the pinned release's docs (tidefell/tidefell is private, so gh needs access to it).
scripts/fetch-docs.sh
# Or use a book built locally from the monorepo:
#   mdbook build docs && mv docs/book tidefell-docs-X.Y.Z && tar -czf tidefell-docs-X.Y.Z.tar.gz tidefell-docs-X.Y.Z
#   scripts/fetch-docs.sh path/to/tidefell-docs-X.Y.Z.tar.gz

zola serve        # http://127.0.0.1:1111
zola build        # writes public/
```

## Deployment

Not set up yet. The plan is GitHub Pages once the repository is public; until then CI uploads
the built site as the `site` artifact of each run.

## Updating the docs

Bump `TIDEFELL_VERSION` to a monorepo release that has a `tidefell-docs-X.Y.Z.tar.gz` asset
(0.3.0 onwards). CI fails if the asset is missing.

## Layout

| Path | Contents |
| --- | --- |
| `content/` | Landing page and blog posts (Markdown) |
| `templates/` | Tera templates |
| `static/` | Stylesheet; `static/docs/` is fetched, not committed |
| `scripts/fetch-docs.sh` | Puts the pinned docs into `static/docs/` |

## Conventions

Read [CONVENTIONS.md](CONVENTIONS.md) before making changes.

## License

Site content is licensed under [Creative Commons Attribution-ShareAlike 4.0](LICENSE)
(`CC-BY-SA-4.0`).
