#!/bin/bash
SUFFIX="D* H*"
list=`ls -d $SUFFIX`
j=0
for k in $list
do
echo $k
rm -rf $k/each_sample
mkdir $k/each_sample
dir=$k/each_sample/

file=$k"/"$k".all"


for((i=1;i<=127;i++))
do
(
echo $i
id=1
lasso=`echo $i|awk '{print $1+1;}'`

fileOut=$dir$i"."$k".error"


echo $fileOut

cut -d',' -f$id","$lasso $file > $fileOut ) &



j=`expr $j + 1`  
if (( $j % 30 == 0))
then

        wait
fi

done
done

