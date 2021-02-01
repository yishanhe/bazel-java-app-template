#!/usr/bin/env bash
set -ex

echo $# > /tmp/bazel.log

echo $@ >> /tmp/bazel.log

file=( -wholename "*$1" )

while [ -n "$2" ]; do
  file+=( -o )
  file+=( -wholename )
  file+=( "*${2}" )
  shift
done


echo $file >> /tmp/bazel.log

bazel run  //tools/linters:buildifier -- --lint=fix $(find "$(pwd -P)" -type f '(' "${file[@]}" ')')
