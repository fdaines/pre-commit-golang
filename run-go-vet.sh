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
echo "1-------------------"
echo $pkg
echo "2-------------------"
echo $@
echo "3-------------------"
echo $params
echo "4-------------------"
echo $files
echo "5-------------------"
for dir in $(echo $@|xargs -n1 dirname|sort -u); do
  echo "x1-------------------"
  echo $pkg/$dir
  echo "x2-------------------"
  go vet $pkg/$dir
  echo "x3-------------------"
done
