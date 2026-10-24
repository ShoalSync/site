# Conventions

Read this before changing anything in this repository.

## Owns

The website, landing pages and blog, and hosting of the docs site.

## Consumes

- The mdBook (which includes the protocol specs), built from the monorepo release pinned by the
  `shoal` input in `flake.nix`.

## Change order

Changes to shared definitions always start in the monorepo: monorepo change → release tag →
pin bump here. This repository never defines a type, message, config key or term that the
monorepo does not. See [repository map](https://github.com/ShoalSync/shoal/blob/main/docs/repos.md).

Work that spans repositories is tracked by one issue in `ShoalSync/shoal`, labelled
`repo:site`.

## Local rules

- **Vocabulary:** use the terms in the [glossary](https://github.com/ShoalSync/shoal/blob/main/docs/glossary.md).
- **Docs content** (admin guide, self-hosting, protocol specs) is written in the monorepo, next
  to the code, and pulled in at build time. Only marketing pages and blog posts are written here.
- Site content is CC-BY-SA-4.0.
- **Commits:** Conventional Commits; see [CONTRIBUTING.md](https://github.com/ShoalSync/shoal/blob/main/CONTRIBUTING.md).

## Read first

1. [Implementation plan](https://github.com/ShoalSync/shoal/blob/main/docs/plan.md)
2. [Glossary](https://github.com/ShoalSync/shoal/blob/main/docs/glossary.md)
3. [Architecture decision records](https://github.com/ShoalSync/shoal/blob/main/docs/adr/)
