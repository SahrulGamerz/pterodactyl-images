#!/bin/bash

# Empty line
echo " "
echo "*************************************************************"
echo "* You have entered shell access mode."
echo "* To exit please enter exit."
echo "* If you stuck inside a program, please restart the container."
echo "*************************************************************"

script -I /dev/null -O /dev/null -B /dev/null -q

# Empty line
echo " "
echo "*************************************************************"
echo "* You have exited shell access mode."
echo "*************************************************************"