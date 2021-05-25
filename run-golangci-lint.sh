#!/usr/bin/env bash
set -e
for dir in $(echo $@|xargs -n1 dirname|sort -u); do
  echo "Run over $dir"
  golangci-lint run $dir
done
