#!/bin/bash

rm -rf eRNA/each_sample
mkdir eRNA/each_sample

file=eRNA/eRNA.all
j=0
#inde
for((i=1;i<=808;i++))
do
(echo $i
id=1
lasso=`echo $i|awk '{print $1+1;}'`
fileOut="eRNA/each_sample/"$i".error"
echo $fileOut
echo $id","$lasso
cut -d',' -f$id","$lasso $file > $fileOut ) &



j=`expr $j + 1`  
if (( $j % 80 == 0))
then

        wait
fi

done


