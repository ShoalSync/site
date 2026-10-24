#!/usr/bin/env bash
# Puts a built book into static/docs/, served at /docs/<version>/ and /docs/latest/.
#
# Usage:
#   scripts/docs.sh                    the pinned monorepo release's book (`nix build .#docs`)
#   scripts/docs.sh <book> <version>   a built book directory, e.g. a monorepo checkout's
#                                      docs/book after `mdbook build docs`
set -euo pipefail

cd "$(dirname "$0")/.."
if [ $# -ge 2 ]; then
  book=$1
  version=$2
else
  book=$(nix build --no-link --print-out-paths .#docs)
  version=${book#*-shoal-docs-}
fi

if [ ! -f "$book/index.html" ]; then
  echo "error: $book does not contain index.html" >&2
  exit 1
fi

rm -rf static/docs
mkdir -p static/docs
cp -R "$book" "static/docs/$version"
cp -R "$book" static/docs/latest
chmod -R u+w static/docs
cat > static/docs/index.html <<HTML
<!DOCTYPE html>
<meta charset="utf-8">
<title>Shoal documentation</title>
<meta http-equiv="refresh" content="0; url=latest/">
<link rel="canonical" href="latest/">
<a href="latest/">Shoal documentation</a>
HTML
echo "$version" > static/docs/VERSION
echo "docs for $version in static/docs/"
