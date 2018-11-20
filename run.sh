#!/bin/bash

rm -f ranks-by-smell.txt ranks-by-metric.txt
touch ranks-by-smell.txt ranks-by-metric.txt

for CODE_SMELL in "_data-class" "_feature-envy" "_god-class" "_long-method"
    do
        for METRIC in "f_score" "inform" "kappa" "pct_dth"
        do
            printf "\n-- ${CODE_SMELL} -- ${METRIC} --\n" >> ranks-by-smell.txt
            cat ${CODE_SMELL}/${CODE_SMELL}-${METRIC}.txt | python stats.py >> ranks-by-smell.txt
        done
    done

for METRIC in "f_score" "inform" "kappa" "pct_dth"
    do
        for CODE_SMELL in "_data-class" "_feature-envy" "_god-class" "_long-method"
        do
            printf "\n-- ${CODE_SMELL} -- ${METRIC} --\n" >> ranks-by-metric.txt
            cat ${CODE_SMELL}/${CODE_SMELL}-${METRIC}.txt | python stats.py >> ranks-by-metric.txt
        done
    done