#!/usr/bin/env bash

set -eu

VERSION="$(git ls-remote --tags git@github.com:garfieldius/t3ll.git | awk '{print $2}' | cut -b11- | sed 's,[^\.0-9],,g' | sort | tail -n 1)"
SHASUM_MACOS_X64=$(curl -fsSL "https://github.com/garfieldius/t3ll/releases/download/v${VERSION}/t3ll-${VERSION}.sierra.bottle.tar.gz.sha256.txt")
SHASUM_MACOS_ARM64=$(curl -fsSL "https://github.com/garfieldius/t3ll/releases/download/v${VERSION}/t3ll-${VERSION}.arm64_big_sur.bottle.tar.gz.sha256.txt")
SHASUM_LINUX=$(curl -fsSL "https://github.com/garfieldius/t3ll/releases/download/v${VERSION}/t3ll-${VERSION}.x86_64_linux.bottle.tar.gz.sha256.txt")
SHASUM_SOURCE=$(curl -fsSL "https://github.com/garfieldius/t3ll/archive/v${VERSION}.tar.gz" | sha256sum | cut -b-64)
DATE=$(date +"%Y.%m.%d %H:%M:%S")

cat t3ll.rb.tmpl \
  | sed "s,__VERSION__,${VERSION}," \
  | sed "s,__SHASUM_MACOS_X64__,${SHASUM_MACOS_X64}," \
  | sed "s,__SHASUM_MACOS_ARM64__,${SHASUM_MACOS_ARM64}," \
  | sed "s,__SHASUM_LINUX__,${SHASUM_LINUX}," \
  | sed "s,__SHASUM_SOURCE__,${SHASUM_SOURCE}," \
  | sed "s,__DATE__,${DATE}," \
  > Formula/t3ll.rb
