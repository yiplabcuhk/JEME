#!/bin/bash

SUFFIX="join/*.sp"

list=`ls $SUFFIX`
j=0
for i in $list
do
(echo $i

cut -d',' -f1-4 $i > $i".id"

cut -d',' -f6-9 $i > $i".f"

cut -d',' -f5,5 $i > $i".label"

paste -d',' $i".id" $i".f" $i".label" > $i".tmp"

cat head $i".tmp" > $i".csv"

rm $i".id"
rm $i".f"
rm $i".label"
rm $i".tmp" ) &
j=`expr $j + 1`  
if (( $j % 30 == 0))
then
        wait
fi


done
