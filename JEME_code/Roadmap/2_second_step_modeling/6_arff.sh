#!/bin/bash
export CLASSPATH=../../weka-3-7-13/weka.jar
echo $CLASSPATH

SUFFIX="join/*.csv"

list=`ls $SUFFIX`
j=0
for i in $list
do
echo $i

(echo $i
fileOut=`echo $i|awk -F'/' '{print $NF}'`
java weka.core.converters.CSVLoader $i -S 1-3 > $i".arff"
java weka.filters.unsupervised.attribute.Discretize \
-i $i".arff" -B 2 -M -1.0 -R last \
-o $i".final.arff" )&
j=`expr $j + 1`  
if (( $j % 10 == 0))
then
        wait
fi

done
