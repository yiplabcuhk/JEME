#!/bin/bash
number=$1



SUFFIX="D* H*"
list=`ls -d $SUFFIX`
str="DNase/each_sample/121.DNase.error.sorted.id"
for k in $list
do
echo $k

file=$k"/each_sample/"$number"."$k".error.sorted.con"
echo $file
str=$str" "$file
done

echo $str
paste -d',' $str > all_error/$number".all_error"

