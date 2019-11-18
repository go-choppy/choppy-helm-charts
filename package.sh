#!/bin/bash

dirs=("charts" "incubator")

for dir in ${dirs[@]};
do
  cd "$dir"
  for subdir in `ls -d */`;
  do
    dirname=`echo "$subdir" | sed "s/\///g"`;
    helm package $dirname -d ../docs
  done
  cd ../
done
