#!/usr/bin/env bash

set -eu

VERSION="$(git ls-remote --tags git@github.com:garfieldius/t3ll.git | awk '{print $2}' | cut -b11- | sed 's,[^\.0-9],,g' | sort | tail -n 1)"

if [[ "$(cat Formula/t3ll.rb | grep ${VERSION})" == "" ]]; then
  SHASUM_MACOS=$(curl -fsSL "https://github.com/garfieldius/t3ll/releases/download/v${VERSION}/t3ll-${VERSION}.sierra.bottle.tar.gz.sha256.txt")
  SHASUM_LINUX=$(curl -fsSL "https://github.com/garfieldius/t3ll/releases/download/v${VERSION}/t3ll-${VERSION}.x86_64_linux.bottle.tar.gz.sha256.txt")
  SHASUM_SOURCE=$(curl -fsSL "https://github.com/garfieldius/t3ll/archive/v${VERSION}.tar.gz" | sha256sum | cut -b-65)
  DATE=$(date +"%Y.%m.%d %H:%M:%S")

  cat t3ll.rb.tmpl \
    | sed "s,__VERSION__,${VERSION}," \
    | sed "s,__SHASUM_MACOS__,${SHASUM_MACOS}," \
    | sed "s,__SHASUM_LINUX__,${SHASUM_LINUX}," \
    | sed "s,__SHASUM_SOURCE__,${SHASUM_SOURCE}," \
    | sed "s,__DATE__,${DATE}," \
    > Formula/t3ll.rb
fi
