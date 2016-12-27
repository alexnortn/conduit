#!/bin/bash
INPUT="../data/townNames/massachusetts-town.csv"

x=$(wc -l < "$INPUT")

split -l $(($x / 8)) $INPUT

for f in xaa xab xac xad xae xaf xag xah xai; do
    bash ./spider-town-3.sh $f &
done

