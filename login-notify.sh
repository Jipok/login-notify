#!/usr/bin/env bash

[[ "$PAM_SERVICE" = "cron" ]] && exit 0
[[ "$PAM_RHOST" =~ "192.168." ]] && exit 0
#[[ "$PAM_TYPE" = "close_session" ]] && exit 0

apiToken='YOUR_BOT_TOKEN'
chatId='CHAT_ID_TO_SEND'

message="${HOSTNAME}: $PAM_RHOST $PAM_TYPE <b>$PAM_USER</b> via ${PAM_TTY}"

curl -s                  \
    -X POST              \
    -d text="$message"   \
    -d chat_id=$chatId   \
    -d parse_mode="HTML" \
    https://api.telegram.org/bot$apiToken/sendMessage
