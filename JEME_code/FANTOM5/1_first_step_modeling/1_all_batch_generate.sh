#!/bin/bash

rm -rf eRNA
mkdir eRNA
mkdir eRNA/out



for((count=1;count<=22;count++))
do
echo $count
./1_batch_generate.sh "chr"$count

done

./1_batch_generate.sh "chrX"


