#!/bin/bash

PLATFORM=$(uname)
if [[ "$PLATFORM" == "Darwin" ]]; then
  BINARY=$(find . -iwholename "*/helm_osx/darwin-amd64/helm" | head -n1)
elif [[ "$PLATFORM" == "Linux" ]]; then
  BINARY=$(find . -iwholename "*/helm/linux-amd64/helm" | head -n1)
else
  echo "$PLATFORM not supported"
  exit 1
fi

${BINARY} $*