#!/bin/bash
SUFFIX="D* H*"
list=`ls -d $SUFFIX`
j=0
for k in $list
do
echo $k


dir=$k/each_sample/
SUFFIX2=$dir"*.error"
list2=`ls $SUFFIX2`
for m in $list2
do
(echo $m

LANG=en_EN sort -T ./ -t',' -k1,1 $m > $m".sorted" 

cut -d',' -f1,1 $m".sorted" > $m".sorted.id"

cut -d',' -f2,2 $m".sorted" > $m".sorted.con"


) &

j=`expr $j + 1`  
if (( $j % 10 == 0))
then

        wait
fi
done
done


