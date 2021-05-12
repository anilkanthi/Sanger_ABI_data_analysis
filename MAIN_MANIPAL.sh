#!/bin/bash

echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: MANIPAL System ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

while true; do
    read -p "For the FORWARD ABI file, Please enter 'F' if FORWARD PRIMER was used or 'R' if REVERSE PRIMER was used : " fr
    case $fr in
        [Ff]* ) bash positive_forward_MANIPAL.sh; break;;
        [Rr]* ) bash negative_forward_MANIPAL.sh; exit;;
        * ) echo "Please answer with 'F' for FORWARD PRIMER or 'R' for REVERSE PRIMER. ";;
    esac
done

while true; do
    read -p "Do you want to process the REVERSE ABI file, please enter with 'Yes' or else 'No' : " yn
    case $yn in
        [Yy]* ) bash reverse_MANIPAL.sh; break;;
        [Nn]* ) echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Thank You for using the MANIPAL system. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; exit;;
        * ) echo "Please answer with 'Y' or 'N'. ";;
    esac
done
