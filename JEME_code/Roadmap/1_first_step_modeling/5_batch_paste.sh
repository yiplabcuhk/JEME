#!/bin/bash
rm -rf all_error
mkdir all_error

for((i=1;i<=127;i++))
do
echo $i
./5_paste.sh $i
done
