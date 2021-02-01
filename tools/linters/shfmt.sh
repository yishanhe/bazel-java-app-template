#!/bin/bash

PLATFORM=$(uname)

if [[ "$PLATFORM" == "Darwin" ]]; then
  BINARY=$(find . -iwholename "*shfmt_osx/file/downloaded" | head -n1)
elif [[ "$PLATFORM" == "Linux" ]]; then
  BINARY=$(find . -iwholename "*shfmt/file/downloaded" | head -n1)
else
  echo "$PLATFORM not supported"
  exit 1
fi

# (-i 2) Indent with 2 spaces
# (-ci) switch cases will be indented
# (-w) write result to file instead of stdout
${BINARY} $*
