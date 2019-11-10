#!/bin/bash

for dir in `ls -d */ | grep -v "docs" | grep -v "configs"`;
do
  printf "   $dir into docs\n";
  dirname=`echo "$dir" | sed "s/\///g"`;
  tar czf "docs/${dirname}.tgz" "${dir}";
done
