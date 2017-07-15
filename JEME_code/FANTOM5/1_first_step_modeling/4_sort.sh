#!/bin/bash

SUFFIX="eRNA/each_sample/*.error"

list=`ls $SUFFIX`
j=0
for i in $list
do
echo $i
LANG=en_EN sort -T ./ -t',' -k1,1 $i > $i".sorted" & 
j=`expr $j + 1`  
if (( $j % 20 == 0))
then

        wait
fi

done
