#!/bin/bash

number=$1

export CLASSPATH=../../weka-3-7-13/weka.jar
echo $CLASSPATH

model=model/model

SUFFIX="./join/"$number".all.sw.se.sp.csv.final.arff"

list=`ls $SUFFIX`


for i in $list
do
echo $i

java weka.classifiers.meta.FilteredClassifier \
-l $model \
-T $i \
-classifications "weka.classifiers.evaluation.output.prediction.CSV -p 3 -file "$i".apply.predictions.csv"

done
