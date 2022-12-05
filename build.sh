#! /bin/bash

echo "================================"
echo "|                              |"
echo "|      Only for LineageOS      |"
echo "|                              |"
echo "================================"
echo
sleep 2s
echo

# Function
build(){
source build/envsetup.sh
export USE_CCACHE=1
ccache -M 50G
export CONFIG_STATE_NOTIFIER=y
export SELINUX_IGNORE_NEVERALLOWS=true
export ALLOW_MISSING_DEPENDENCIES=true
lunch lineage_$device-userdebug
make bacon
}

# user input
read -p "Enter your device codename: " device
read -p "Delete residuals from previous builds?: " options

# Black magic
case $options in
	y|Y|yes)echo
	echo "cleaning out-->target-->product-->$device"
	sleep 5s
	rm -rf ${pwd}/out/target/product/$device
	echo "Cleaned AF!!"
	build
	;;
	n|N|no)echo
	echo "Your wish bitch!!"
	sleep 2s
	echo "your Build has started for $device"
	sleep 5s
	build
	;;
esac
