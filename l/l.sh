#!/usr/bin/env bash

#formato de input ./l tex.txt 4 13
a=$(($3-$2+1))
head -$3 $1 | tail -$a 
