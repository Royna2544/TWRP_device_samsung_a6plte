#!/bin/bash

export CHAT_ID=1185607882
export BOT_TOKEN=1778450925:AAFtqQlp_xMDhOyYFE6EiO7SGy-1rrX3sQQ
function tg_sendText() {
curl -s "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
-d "parse_mode=html" \
-d text="${1}" \
-d chat_id=$CHAT_ID \
-d "disable_web_page_preview=true"
}

function tg_sendFile() {
curl -F chat_id=$CHAT_ID -F document=@${1} -F parse_mode=markdown https://api.telegram.org/bot$BOT_TOKEN/sendDocument
}

tg_sendText "Lunching"
git clone https://github.com/roynatech2544/TWRP_device_samsung_a6plte.git device/samsung/a6plte
. build/envsetup.sh
lunch omni_a6plte-eng
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export CCACHE_DIR=/tmp/ccache
ccache -M 16G
ccache -o compression=true
ccache -z
tg_sendText "Starting Compilation by part"
# Let's compile by parts! Coz of ram issue
mka recoveryimage
ccache -s
