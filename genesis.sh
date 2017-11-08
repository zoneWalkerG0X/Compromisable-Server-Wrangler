# The server running this code must never reboot, otherwise it would be troublesome to re-start this script since it's polynominelistic.

#!/bin/bash

while true
do 

a=$(ps -A | grep "G0X_SERVER")
if [ -z "$a" ]
then

        n=$(date +%s)
        if [ $n % 60 ]
        then
                echo "Reloading."
                me=`basename "$0"`
                newme=$(date +%S%N)
                cp $me $newme
                rm $me
                eval $newme
        fi

        echo "Server is not running. Starting server."
        echo "Shutdown at $(date)" >> G0X.trace
        ./G0X_SERVER
fi

done
