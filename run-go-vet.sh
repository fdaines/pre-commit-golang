#!/usr/bin/env bash
set -e
files=()
params=()
for item in "$@";do
  echo "Current item: $item"
  if [[ $item == -* ]]
  then
     echo "is a param"
     params+=($item)  
  else
     echo "is a file"
     files+=($item)
  fi
done
  
pkg=$(go list)
for dir in $(echo ${files[@]}|xargs -n1 dirname|sort -u); do
  echo "x1-------------------"
  echo $pkg/$dir
  go vet ${params[@]} $pkg/$dir
  echo "x3-------------------"
done
