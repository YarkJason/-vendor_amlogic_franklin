#!/system/bin/sh
sdcard=/data/media/0
mkdir_test_flag=/data/media/0/YXTFEATUREAGING.txt
remove_test_flag=/data/local/tmp/remove_test.txt
if [ ! -e $sdcard ]; then
busybox mkdir $sdcard
fi
#It is necessary to confirm that the deviceid is to be burned. If it is not burned, the script cannot be started. 
#When the test exceeds 1 hour, the deviceid value will be changed to 123456789
get_aging_flag=`getprop persist.sys.autoaging`
echo "$get_aging_flag"
if [ $get_aging_flag == "true" ]; then
touch $mkdir_test_flag
echo "start bootup YXTFEATUREAGING.txt" >> $mkdir_test_flag
else
rm $mkdir_test_flag
touch $remove_test_flag
#echo "remove YXTFEATUREAGING.txt!!!" >> $remove_test_flag
fi
