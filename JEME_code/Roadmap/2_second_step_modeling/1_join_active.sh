#!/bin/bash
#Only retain the pairs with the active enhancers in each sample
#The labels in the column label are random here
SUFFIX="../1_first_step_modeling/all_error/*.all_error"

list=`ls $SUFFIX`
rm -rf join
mkdir join
j=0
for i in $list
do
(echo $i
idt=`echo $i|awk -F'/' '{print $NF}'|awk -F'.' '{print $1}'`
echo $idt
active=active/$idt".active"
LANG=en_EN join -t',' $active $i | LANG=en_EN sort -T ./ -t',' -k1,1 > join/$idt".all" ) &

j=`expr $j + 1`  
if (( $j % 10 == 0))
then
        wait
fi



done
