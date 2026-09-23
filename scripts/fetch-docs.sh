#!/usr/bin/env bash
# Puts the documentation of the pinned monorepo release (TIDEFELL_VERSION) into static/docs/,
# served at /docs/<version>/ and /docs/latest/.
#
# Usage:
#   scripts/fetch-docs.sh              download the release asset with `gh` (needs GH_TOKEN,
#                                      since tidefell/tidefell is private)
#   scripts/fetch-docs.sh <tarball>    use a local tidefell-docs-<version>.tar.gz instead,
#                                      e.g. one built with `mdbook build docs` and packaged
set -euo pipefail

cd "$(dirname "$0")/.."
version=$(tr -d '[:space:]' < TIDEFELL_VERSION)
name="tidefell-docs-$version"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

if [ $# -ge 1 ]; then
  cp "$1" "$work/$name.tar.gz"
else
  gh release download "v$version" --repo tidefell/tidefell --dir "$work" \
    --pattern "$name.tar.gz" --pattern "$name.tar.gz.sha256"
  (cd "$work" && sha256sum --check "$name.tar.gz.sha256")
fi

tar -xzf "$work/$name.tar.gz" -C "$work"
if [ ! -f "$work/$name/index.html" ]; then
  echo "error: $name.tar.gz does not contain $name/index.html" >&2
  exit 1
fi

rm -rf static/docs
mkdir -p static/docs
cp -R "$work/$name" "static/docs/$version"
cp -R "$work/$name" static/docs/latest
cat > static/docs/index.html <<HTML
<!DOCTYPE html>
<meta charset="utf-8">
<title>Tidefell documentation</title>
<meta http-equiv="refresh" content="0; url=latest/">
<link rel="canonical" href="latest/">
<a href="latest/">Tidefell documentation</a>
HTML
echo "docs for $version in static/docs/"
