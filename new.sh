cd "`dirname $0`"
device=`platform-tools-darwin/fastboot $* getvar product 2>&1 | grep -F 'product:' | tr -s ' ' | cut -d ' ' -f 2`
[ -z "$device" ] && device='unknown'
[ "$device" != 'umi' ] && echo "This package is for \"umi\" devices; this is a \"$device\"."

read -p "You are going to wipe your data and internal storage. It will delete all your files and photos stored on internal storage. Do you agree? (Y/N) " choice
[ "$choice" != 'Y' ] && [ "$choice" != 'y' ] && exit 0

platform-tools-darwin/fastboot $* erase boot
if [ $? -ne 0 ] ; then echo "Erase boot error"; exit 1; fi
platform-tools-darwin/fastboot $* flash crclist `dirname $0`/images/crclist.txt
if [ $? -ne 0 ] ; then echo "Flash crclist error"; exit 1; fi
platform-tools-darwin/fastboot $* flash xbl_4 `dirname $0`/images/xbl_4.elf
if [ $? -ne 0 ] ; then echo "Flash xbl_4 error"; exit 1; fi
#fastboot $* flash xblbak `dirname $0`/images/xbl.elf
#if [ $? -ne 0 ] ; then echo "Flash xblbak error"; exit 1; fi
platform-tools-darwin/fastboot $* flash xbl_config_4 `dirname $0`/images/xbl_config_4.elf
if [ $? -ne 0 ] ; then echo "Flash xbl_config_4 error"; exit 1; fi
platform-tools-darwin/fastboot $* flash xbl_5 `dirname $0`/images/xbl_5.elf
if [ $? -ne 0 ] ; then echo "Flash xbl_5 error"; exit 1; fi
#fastboot $* flash xblbak `dirname $0`/images/xbl.elf
#if [ $? -ne 0 ] ; then echo "Flash xblbak error"; exit 1; fi
platform-tools-darwin/fastboot $* flash xbl_config_5 `dirname $0`/images/xbl_config_5.elf
if [ $? -ne 0 ] ; then echo "Flash xbl_config_5 error"; exit 1; fi
platform-tools-darwin/fastboot $* flash abl `dirname $0`/images/abl.elf
if [ $? -ne 0 ] ; then echo "Flash abl error"; exit 1; fi
#fastboot $* flash ablbak `dirname $0`/images/abl.elf
#if [ $? -ne 0 ] ; then echo "Flash ablbak error"; exit 1; fi
platform-tools-darwin/fastboot $* flash tz `dirname $0`/images/tz.mbn
if [ $? -ne 0 ] ; then echo "Flash tz error"; exit 1; fi
#fastboot $* flash tzbak `dirname $0`/images/tz.mbn
#if [ $? -ne 0 ] ; then echo "Flash tzbak error"; exit 1; fi
platform-tools-darwin/fastboot $* flash hyp `dirname $0`/images/hyp.mbn
if [ $? -ne 0 ] ; then echo "Flash hyp error"; exit 1; fi
#fastboot $* flash hypbak `dirname $0`/images/hyp.mbn
#if [ $? -ne 0 ] ; then echo "Flash hypbak error"; exit 1; fi
platform-tools-darwin/fastboot $* flash devcfg `dirname $0`/images/devcfg.mbn
if [ $? -ne 0 ] ; then echo "Flash devcfg error"; exit 1; fi
#fastboot $* flash devcfgbak `dirname $0`/images/devcfg.mbn
#if [ $? -ne 0 ] ; then echo "Flash devcfgbak error"; exit 1; fi
platform-tools-darwin/fastboot $* flash storsec `dirname $0`/images/storsec.mbn
if [ $? -ne 0 ] ; then echo "Flash storsec error"; exit 1; fi
#fastboot $* flash storsecbak `dirname $0`/images/storsec.mbn
#if [ $? -ne 0 ] ; then echo "Flash storsecbak error"; exit 1; fi
platform-tools-darwin/fastboot $* flash bluetooth `dirname $0`/images/BTFM.bin
if [ $? -ne 0 ] ; then echo "Flash bluetooth error"; exit 1; fi
platform-tools-darwin/fastboot $* flash cmnlib `dirname $0`/images/cmnlib.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlib error"; exit 1; fi
#fastboot $* flash cmnlibbak `dirname $0`/images/cmnlib.mbn
#if [ $? -ne 0 ] ; then echo "Flash cmnlibbak error"; exit 1; fi
platform-tools-darwin/fastboot $* flash cmnlib64 `dirname $0`/images/cmnlib64.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlib64 error"; exit 1; fi
#fastboot $* flash cmnlib64bak `dirname $0`/images/cmnlib64.mbn
#if [ $? -ne 0 ] ; then echo "Flash cmnlib64bak error"; exit 1; fi
platform-tools-darwin/fastboot $* flash modem `dirname $0`/images/NON-HLOS.bin
if [ $? -ne 0 ] ; then echo "Flash modem error"; exit 1; fi
platform-tools-darwin/fastboot $* flash dsp `dirname $0`/images/dspso.bin
if [ $? -ne 0 ] ; then echo "Flash dsp error"; exit 1; fi
platform-tools-darwin/fastboot $* flash keymaster `dirname $0`/images/km4.mbn
if [ $? -ne 0 ] ; then echo "Flash keymaster error"; exit 1; fi
#fastboot $* flash keymasterbak `dirname $0`/images/keymaster64.mbn
#if [ $? -ne 0 ] ; then echo "Flash keymaster error"; exit 1; fi
platform-tools-darwin/fastboot $* flash logo `dirname $0`/images/logo.img
if [ $? -ne 0 ] ; then echo "Flash logo error"; exit 1; fi
#fastboot $* flash splash `dirname $0`/images/splash.img
#if [ $? -ne 0 ] ; then echo "Flash splash error"; exit 1; fi
platform-tools-darwin/fastboot $* flash featenabler `dirname $0`/images/featenabler.mbn
if [ $? -ne 0 ] ; then echo "Flash featenabler error"; exit 1; fi
platform-tools-darwin/fastboot $* flash misc `dirname $0`/images/misc.img
if [ $? -ne 0 ] ; then echo "Flash misc error"; exit 1; fi
platform-tools-darwin/fastboot $* flash aop `dirname $0`/images/aop.mbn
if [ $? -ne 0 ] ; then echo "Flash aop error"; exit 1; fi
platform-tools-darwin/fastboot $* flash qupfw `dirname $0`/images/qupv3fw.elf
if [ $? -ne 0 ] ; then echo "Flash qupfw error"; exit 1; fi
platform-tools-darwin/fastboot $* flash uefisecapp `dirname $0`/images/uefi_sec.mbn
if [ $? -ne 0 ] ; then echo "Flash uefisecapp error"; exit 1; fi
platform-tools-darwin/fastboot $* flash multiimgoem `dirname $0`/images/multi_image.mbn
if [ $? -ne 0 ] ; then echo "Flash multiimgoem error"; exit 1; fi
platform-tools-darwin/fastboot $* flash super `dirname $0`/images/super.img
if [ $? -ne 0 ] ; then echo "Flash super error"; exit 1; fi
platform-tools-darwin/fastboot $* flash vbmeta `dirname $0`/images/vbmeta.img
if [ $? -ne 0 ] ; then echo "Flash vbmeta error"; exit 1; fi
platform-tools-darwin/fastboot $* flash dtbo `dirname $0`/images/dtbo.img
if [ $? -ne 0 ] ; then echo "Flash dtbo error"; exit 1; fi
platform-tools-darwin/fastboot $* flash vbmeta_system `dirname $0`/images/vbmeta_system.img
if [ $? -ne 0 ] ; then echo "Flash vbmeta_system error"; exit 1; fi
#fastboot $* flash odm `dirname $0`/images/odm.img
#if [ $? -ne 0 ] ; then echo "Flash odm error"; exit 1; fi
platform-tools-darwin/fastboot $* flash cache `dirname $0`/images/cache.img
if [ $? -ne 0 ] ; then echo "Flash cache error"; exit 1; fi
platform-tools-darwin/fastboot $* erase metadata
if [ $? -ne 0 ] ; then echo "Erase metadata error"; exit 1; fi
platform-tools-darwin/fastboot $* flash userdata `dirname $0`/images/userdata.img
if [ $? -ne 0 ] ; then echo "Flash userdata error"; exit 1; fi
platform-tools-darwin/fastboot $* flash recovery `dirname $0`/images/recovery.img
if [ $? -ne 0 ] ; then echo "Flash recovery error"; exit 1; fi
#fastboot $* erase sec
#if [ $? -ne 0 ] ; then echo "Erase sec error"; exit 1; fi
if [ -f `dirname $0`/images/exaid.img ]; then
platform-tools-darwin/fastboot $* flash exaid `dirname $0`/images/exaid.img
if [ $? -ne 0 ] ; then echo "Flash exaid error"; exit 1; fi
else
platform-tools-darwin/fastboot $* erase exaid
if [ $? -ne 0 ] ; then echo "Erase exaid error"; exit 1; fi
fi
platform-tools-darwin/fastboot $* flash cust `dirname $0`/images/cust.img
if [ $? -ne 0 ] ; then echo "Flash cust error"; exit 1; fi
platform-tools-darwin/fastboot $* flash boot `dirname $0`/images/boot.img
if [ $? -ne 0 ] ; then echo "Flash boot error"; exit 1; fi
platform-tools-darwin/fastboot $* oem lock
if [ $? -ne 0 ] ; then echo "Oem lock error"; exit 1; fi
