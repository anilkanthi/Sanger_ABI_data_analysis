#!/bin/bash

echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Reverse ABI Analysis ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

echo "																					"

while true; do
    read -p "For the REVERSE ABI file, Please enter 'F' if FORWARD PRIMER was used or 'R' if REVERSE PRIMER was used :" fr
    case $fr in
        [Ff]* ) bash negative_reverse_MANIPAL.sh; break;;
        [Rr]* ) bash positive_reverse_MANIPAL.sh; exit;;
        * ) echo "Please answer with 'F' for FORWARD PRIMER or 'R' for REVERSE PRIMER. ";;
    esac
done

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Thank You for using the MANIPAL system. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
