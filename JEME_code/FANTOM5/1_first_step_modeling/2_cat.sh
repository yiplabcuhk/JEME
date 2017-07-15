#!/bin/bash

list=`ls -d eRNA*`
for i in $list
do
echo $i
suffix="$i/out/*.result"
files=`ls $suffix`
echo $files
cat $files > $i"/"$i".all"
done
