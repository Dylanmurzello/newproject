cd "`dirname $0`"
device=`platform-tools-darwin/fastboot $* getvar product 2>&1 | grep -F 'product:' | tr -s ' ' | cut -d ' ' -f 2`
[ -z "$device" ] && device='unknown'
[ "$device" != 'unknown' ] && echo "This package is for \"umi\" devices; this is a \"$device\"." && exit 1

read -p "You are going to wipe your data and internal storage. It will delete all your files and photos stored on internal storage. Do you agree? (Y/N) " choice
[ "$choice" != 'Y' ] && [ "$choice" != 'y' ] && exit 0

platform-tools-darwin/fastboot $* flash cmnlib64 images/cmnlib64.mbn
platform-tools-darwin/fastboot $* flash xbl_config_5 images/xbl_config_5.elf
platform-tools-darwin/fastboot $* flash modem images/NON-HLOS.bin
platform-tools-darwin/fastboot $* flash cmnlib images/cmnlib.mbn
platform-tools-darwin/fastboot $* flash bluetooth images/BTFM.bin
platform-tools-darwin/fastboot $* flash keymaster images/km4.mbn
platform-tools-darwin/fastboot $* flash xbl_5 images/xbl_5.elf
platform-tools-darwin/fastboot $* flash tz images/tz.mbn
platform-tools-darwin/fastboot $* flash aop images/aop.mbn
platform-tools-darwin/fastboot $* flash featenabler images/featenabler.mbn
platform-tools-darwin/fastboot $* flash xbl_config_4 images/xbl_config_4.elf
platform-tools-darwin/fastboot $* flash storsec images/storsec.mbn
platform-tools-darwin/fastboot $* flash uefisecapp images/uefi_sec.mbn
platform-tools-darwin/fastboot $* flash qupfw images/qupv3fw.elf
platform-tools-darwin/fastboot $* flash abl images/abl.elf
platform-tools-darwin/fastboot $* flash dsp images/dspso.bin
platform-tools-darwin/fastboot $* flash devcfg images/devcfg.mbn
platform-tools-darwin/fastboot $* flash xbl_4 images/xbl_4.elf
platform-tools-darwin/fastboot $* flash hyp images/hyp.mbn
platform-tools-darwin/fastboot $* flash cmnlib64bak images/cmnlib64.mbn
platform-tools-darwin/fastboot $* flash cmnlibbak images/cmnlib.mbn
platform-tools-darwin/fastboot $* flash tzbak images/tz.mbn
platform-tools-darwin/fastboot $* flash aopbak images/aop.mbn
platform-tools-darwin/fastboot $* flash storsecbak images/storsec.mbn
platform-tools-darwin/fastboot $* flash qupfwbak images/qupv3fw.elf
platform-tools-darwin/fastboot $* flash ablbak images/abl.elf
platform-tools-darwin/fastboot $* flash devcfgbak images/devcfg.mbn
platform-tools-darwin/fastboot $* flash hypbak images/hyp.mbn
platform-tools-darwin/fastboot $* flash boot images/boot.img
platform-tools-darwin/fastboot $* flash logo images/logo.img
platform-tools-darwin/fastboot $* flash dtbo images/dtbo.img
platform-tools-darwin/fastboot $* flash vbmeta images/vbmeta.img
platform-tools-darwin/fastboot $* flash vbmeta_system images/vbmeta_system.img
platform-tools-darwin/fastboot $* flash cust images/cust.img
platform-tools-darwin/fastboot $* flash super images/super.img
platform-tools-darwin/fastboot $* erase metadata
platform-tools-darwin/fastboot -w
platform-tools-darwin/fastboot $* reboot
