#!/bin/bash

SUFFIX="./join/*.sw"

list=`ls $SUFFIX`
j=0
for i in $list
do
(echo $i
idt=`echo $i|awk -F'/' '{print $NF}' | awk -F'.' '{print $1}'`
echo $idt
enhancer="./roadmap_scale_sample_specific_each/enhancer/all/enhancer."$idt".scale"
LANG=en_EN join -t',' -1 2 -2 1 $i $enhancer | LANG=en_EN sort -t',' -k3,3 -T ./ > $i".se" ) &

j=`expr $j + 1`
if (( $j % 20 == 0))
then
        wait
fi

done
