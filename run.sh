#!/bin/bash

rm -rf ranks-by-smell.txt ranks-by-metric.txt

touch ranks-by-smell.txt ranks-by-metric.txt

for CODE_SMELL in "cl-data-class" "cl-god-class" "ml-feature-envy" "ml-long-method"
    do
    for METRIC in "acc" "f_score" "pct_dth"
        do
            echo "1/2 ${CODE_SMELL} ${METRIC}"
            printf "\n-- ${CODE_SMELL} -- ${METRIC} --\n" >> ranks-by-smell.txt
            cat __results/${CODE_SMELL}/${CODE_SMELL}-${METRIC}.txt | python stats.py >> ranks-by-smell.txt
        done
    done

for METRIC in "acc" "f_score" "pct_dth"
    do
    for CODE_SMELL in "cl-data-class" "cl-god-class" "ml-feature-envy" "ml-long-method"
        do
            echo "2/2 ${CODE_SMELL} ${METRIC}"
            printf "\n-- ${CODE_SMELL} -- ${METRIC} --\n" >> ranks-by-metric.txt
            cat __results/${CODE_SMELL}/${CODE_SMELL}-${METRIC}.txt | python stats.py >> ranks-by-metric.txt
        done
    done

#for ROOT in "__norm-r" "__smote-r" "__both-r"
#    do
#        rm -rf ${ROOT}
#        mkdir ${ROOT}
#        touch ${ROOT}/ranks-by-smell.txt
#        touch ${ROOT}/ranks-by-metric.txt
#    done
#
#for ROOT in "__norm" "__smote"  "__both"
#    do
#        for CODE_SMELL in "cl-data-class" "cl-god-class" "ml-feature-envy" "ml-long-method"
#            do
#                for METRIC in "acc" "f_score" "kappa" "inform" "pct_dth"
#                do
#                    printf "\n-- ${CODE_SMELL} -- ${METRIC} --\n" >> ${ROOT}-r/ranks-by-smell.txt
#                    cat ${ROOT}/${CODE_SMELL}/${CODE_SMELL}-${METRIC}.txt | python stats.py >> ${ROOT}-r/ranks-by-smell.txt
#                done
#            done
#    done
#
#for ROOT in "__norm" "__smote" "__both"
#    do
#        for METRIC in "acc" "f_score" "kappa" "inform" "pct_dth"
#            do
#            for CODE_SMELL in "cl-data-class" "cl-god-class" "ml-feature-envy" "ml-long-method"
#                do
#                    printf "\n-- ${CODE_SMELL} -- ${METRIC} --\n" >> ${ROOT}-r/ranks-by-metric.txt
#                    cat ${ROOT}/${CODE_SMELL}/${CODE_SMELL}-${METRIC}.txt | python stats.py >> ${ROOT}-r/ranks-by-metric.txt
#                done
#            done
#    done