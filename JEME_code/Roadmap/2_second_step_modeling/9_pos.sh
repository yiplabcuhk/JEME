#!/bin/bash

SUFFIX="result/*.out"
rm -rf predictions
mkdir predictions
list=`ls $SUFFIX`

for i in $list
do
echo $i
idt=`echo $i|awk -F'/' '{print $NF}'|awk -F'.' '{print $1}'`
cat $i | awk -F',' '{
if($3>=0.35)
{
print $0;
}}' > predictions/$idt".csv"

done
