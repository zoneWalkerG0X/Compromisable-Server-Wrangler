#!/bin/bash

while true
do 

a=$(ps -A | grep "G0X_SERVER")
if [ -z "$a" ]
then

        echo "Server is not running. Starting server."
        echo "Shutdown at $(date)" >> G0X.trace
        ./G0X_SERVER

done
