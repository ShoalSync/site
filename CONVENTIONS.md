# Conventions

Read this before changing anything in this repository.

## Owns

The website, landing pages and blog, and hosting of the docs site.

## Consumes

- The built mdBook (`tidefell-docs-X.Y.Z.tar.gz`, which includes the protocol specs) from the
  monorepo release pinned by `TIDEFELL_VERSION`, fetched by `scripts/fetch-docs.sh`.

## Change order

Changes to shared definitions always start in the monorepo: monorepo change → release tag →
pin bump here. This repository never defines a type, message, config key or term that the
monorepo does not. See [repository map](https://github.com/tidefell/tidefell/blob/main/docs/repos.md).

Work that spans repositories is tracked by one issue in `tidefell/tidefell`, labelled
`repo:site`.

## Local rules

- **Vocabulary:** use the terms in the [glossary](https://github.com/tidefell/tidefell/blob/main/docs/glossary.md).
- **Docs content** (admin guide, self-hosting, protocol specs) is written in the monorepo, next
  to the code, and pulled in at build time. Only marketing pages and blog posts are written here.
- Site content is CC-BY-SA-4.0.
- **Commits:** Conventional Commits; see [CONTRIBUTING.md](https://github.com/tidefell/tidefell/blob/main/CONTRIBUTING.md).

## Read first

1. [Implementation plan](https://github.com/tidefell/tidefell/blob/main/docs/plan.md)
2. [Glossary](https://github.com/tidefell/tidefell/blob/main/docs/glossary.md)
3. [Architecture decision records](https://github.com/tidefell/tidefell/blob/main/docs/adr/)
