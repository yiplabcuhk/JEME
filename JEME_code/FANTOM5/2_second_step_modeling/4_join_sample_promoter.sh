#!/bin/bash

SUFFIX="./join/*.se"

list=`ls $SUFFIX`
j=0
for i in $list
do
(echo $i
idt=`echo $i|awk -F'/' '{print $NF}' | awk -F'.' '{print $1}'`
echo $idt
promoter="FANTOM5_scale_sample_specific_each/promoter/all/promoter."$idt".scale.sorted"
LANG=en_EN join -t',' -1 3 -2 1 $i $promoter | LANG=en_EN sort -t',' -k1,1 > $i".sp" ) &
j=`expr $j + 1`
if (( $j % 80 == 0))
then
        wait
fi
done
