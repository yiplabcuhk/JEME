#!/bin/bash

chr=$1
dir1=1MB_intervals/DNase
dir2=1MB_intervals/H3K27ac
dir3=1MB_intervals/H3K27me3
dir4=1MB_intervals/H3K4me1

list=`ls -d $dir1 $dir2 $dir3 $dir4`
j=0
for i in $list
do
echo $i
feature=`echo $i|awk -F'/' '{print $NF}'`
SUFFIX=$i"/final/"$feature".enhancer_127.head."$chr".ordered.csv.bed.overlap.sort."$chr"_*.head"
list2=`ls $SUFFIX`



for k in $list2
do
(
echo $k
idt=`echo $k|awk -F'/' '{print $NF}' | awk -F'.' '{print $(NF-1)}'`
echo $idt

tss="1MB_intervals/gene/final/gene."$chr"."$idt
echo $tss
out="result/"$feature"/out/"$feature"."$idt".result"
echo $out
Rscript 1_generate.R $k $tss $feature $idt $out ) &

j=`expr $j + 1`  
if (( $j % 80 == 0))
then

        wait
fi
done
done
