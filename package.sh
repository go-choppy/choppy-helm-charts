#!/bin/bash

cd charts
for dir in `ls -d */`;
do
  printf "   $dir into docs\n";
  dirname=`echo "$dir" | sed "s/\///g"`;
  helm package $dirname
  mv -f ${dirname}*.tgz ../docs
done
