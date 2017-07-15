#!/bin/bash

chr=$1
dir="1MB_intervals/"

SUFFIX=$dir"enhancer.final.withHead."$chr".ordered.csv.bed.overlap."$chr"_*"
list=`ls $SUFFIX`
j=0
for i in $list
do
   
    (echo $j



    idt=`echo $i|awk -F'/' '{print $NF}' | awk -F'.' '{print $NF}' `
    tssFile=$dir"mRNA.final.withHead.rle."$chr".ordered.csv.bed.overlap."$idt


    echo $i
    echo $tssFile
    echo $idt
    Rscript 1_generate.R $i $tssFile $idt "eRNA/out/eRNA."$idt".result" ) &

    j=`expr $j + 1`
    if (( $j % 80 == 0))
    then

        wait
    fi
done




