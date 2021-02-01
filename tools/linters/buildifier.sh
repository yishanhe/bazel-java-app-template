#!/bin/bash

PLATFORM=$(uname)

if [[ "$PLATFORM" == "Darwin" ]]; then
  BINARY=$(find . -iwholename "*buildifier_osx/file/downloaded" | head -n1)
elif [[ "$PLATFORM" == "Linux" ]]; then
  BINARY=$(find . -iwholename "*buildifier/file/downloaded" | head -n1)
else
  echo "$PLATFORM not supported"
  exit 1
fi

${BINARY} $*