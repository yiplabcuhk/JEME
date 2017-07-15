#!/bin/bash
j=0
for((i=1;i<=808;i++))
do
echo $i
./7_apply.sh $i &

j=`expr $j + 1`  
if (( $j % 10 == 0))
then
        wait
fi

done
