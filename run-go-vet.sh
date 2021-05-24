#!/usr/bin/env bash
set -e
files=()
params=()
for item in "$@";do
  if [[ $item == -* ]]
  then
     params+=($item)  
  else
     files+=($item)
  fi
done
  
pkg=$(go list)
for dir in $(echo ${files[@]}|xargs -n1 dirname|sort -u); do
  go vet ${params[@]} $pkg/$dir
done
