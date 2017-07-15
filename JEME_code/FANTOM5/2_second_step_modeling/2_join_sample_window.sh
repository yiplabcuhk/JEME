#!/bin/bash

SUFFIX="./join/*.all"

list=`ls $SUFFIX`

j=0
for i in $list
do
(echo $i

idt=`echo $i|awk -F'/' '{print $NF}' | awk -F'.' '{print $1}'`
echo $idt
window="FANTOM5_scale_sample_specific_each/window/all/window."$idt".scale.sorted" 

LANG=en_EN join -t',' $i $window | LANG=en_EN sort -t',' -k2,2 > $i".sw" ) &

j=`expr $j + 1`  
if (( $j % 80 == 0))
then
        wait
fi


done
