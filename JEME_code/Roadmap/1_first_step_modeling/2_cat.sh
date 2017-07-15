#!/bin/bash

list=`ls -d result/D* result/H*`
for i in $list
do
echo $i
suffix="$i/out/*.result"
files=`ls $suffix`
echo $files
feature=`echo $i|awk -F'/' '{print $NF}'`
mkdir $feature
(cat $files > $feature"/"$feature".all" ) &
done
