#!/bin/bash

mkdir result
mkdir result/DNase
mkdir result/H3K27ac
mkdir result/H3K27me3
mkdir result/H3K4me1

mkdir result/DNase/out
mkdir result/H3K27ac/out
mkdir result/H3K27me3/out
mkdir result/H3K4me1/out

for((count=1;count<=22;count++))
do
echo $count
./1_batch_generate.sh "chr"$count
done

./1_batch_generate.sh "chrX"


