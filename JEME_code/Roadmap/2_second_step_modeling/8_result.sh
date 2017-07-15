#!/bin/bash

#1,1:'\'(-inf-0.5]\'',1:'(-inf-0.5]',,1
SUFFIX="join/*.predictions.csv"
rm -rf result
mkdir result
dir="./result/"
list=`ls $SUFFIX`
j=0
for file in $list
do
fileOut=`echo $file|awk -F'/' '{print $NF}'`
echo $fileOut
cat $file | awk -F',' 'BEGIN{a=0}
{a=a+1;
    if(a>1 && $0~/chr/)
        {
            split($2,label,":"); 
            split($3,predict,":");
            score=$5
            if(predict[1]==1)
                {
                    score=1-score;

                }
                gsub(/\\/,"",$6);
                split($6,array,"_");
                print array[1]","array[2]","score
            
        }
    }' | sed "s/'//g" > $dir$fileOut".out" &
j=`expr $j + 1`  
 if (( $j % 20 == 0))
    then
        #sleep 10
        wait
    fi
done
