#!/system/bin/sh

MARK=/data/local/tmp/symbol_thirdpart_apks_installed
PKGS=/vendor/preinstall/
LOGTEXT=/data/local/tmp/log.txt

#/system/xbin/daemonsu --auto-daemon &
if [ ! -e $MARK ]; then
touch $LOGTEXT
settings put global verifier_verify_adb_installs 0
settings put global package_verifier_enable 0
echo "booting the first time, so pre-install some APKs." >> /data/local/tmp/log.txt

echo "install kodi at first"
/system/bin/pm install /vendor/kodi/kdplayer.apk

pm grant org.xbmc.kodi android.permission.WRITE_EXTERNAL_STORAGE
pm grant org.xbmc.kodi android.permission.READ_EXTERNAL_STORAGE
#busybox mkdir /sdcard/Android
#busybox mkdir /sdcard/Android/data
#busybox unzip /vendor/kodi/org.xbmc.kodi.zip -o -q -d /sdcard/Android/data
#sync
#busybox find $PKGS -name "*\.apk" -exec sh /system/bin/pm install {} \;
APKLIST='ls /vendor/preinstall/*.apk'
for INFILES in $APKLIST
do
  echo $INFILES >> /data/local/tmp/log.txt
  /system/bin/pm install -r $INFILES
done
echo "OK, installation complete."
echo "OK, installation complete." >> /data/local/tmp/log.txt
touch $MARK
fi
