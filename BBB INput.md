#beagleBoard INput analog
1. cat $SLOTS
2. echo $SLOTS
3. echo "BB-ADC" > $SLOTS
4. cd /sys/bus/iio/devices/iio\:device:0
5. ls -l
6. watch -n 1 cat ./in_volatge1_raw

#beagleBoard INput analog 2
1. cat $SLOTS
2. echo $SLOTS
3. cd /sys/class/gpio
4. ls
5. echo 115 > export(new folder)
6. cd ./gpio115
7. ls -l
8. cat ./direction
9. cat ./value
10. to change to ouput echo out > direction
6. watch 
7. cd ../
8. echo 115 > unexport

#Coding C
1. 