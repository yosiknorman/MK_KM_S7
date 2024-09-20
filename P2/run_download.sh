#!/bin/bash

while true;
do
grads -lbxc subset.gs
./plot.R
sleep 20
done