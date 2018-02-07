#!/bin/sh -e

xcconfig=$(mktemp /tmp/static.xcconfig.XXXXXX)
trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

CURRENT_PATH=$(pwd)
# echo $CURRENT_PATH

echo "LD = ${CURRENT_PATH}/ld.py" >> $xcconfig
echo "DEBUG_INFORMATION_FORMAT = dwarf" >> $xcconfig

# cat $xcconfig
export XCODE_XCCONFIG_FILE="$xcconfig"

# carthage bootstrap "$@" --platform ios
# carthage build "$@" --platform ios
if [[ -e "Carthage" ]]; then
	#移除 Carthage 文件夹
	rm -R Carthage
fi
carthage update "$@" --platform ios