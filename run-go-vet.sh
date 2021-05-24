#!/usr/bin/env bash
set -e
pkg=$(go list)
echo $pkg
echo $@
echo $(echo $@|xargs -n1 dirname|sort -u)
for dir in $(echo $@|xargs -n1 dirname|sort -u); do
  echo $pkg/$dir
  go vet $pkg/$dir
done
