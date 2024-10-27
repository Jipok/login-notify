#!/usr/bin/env bash

apiToken='YOUR_BOT_TOKEN'
chatId='CHAT_ID_TO_SEND'

## Installer mode
if [[ -z "$PAM_USER" ]]; then
case "$1" in
    install)
        [[ "$apiToken" = "YOUR_BOT_TOKEN" ]] && echo "You must set bot token" && exit 1
        [[ "$chatId" = "CHAT_ID_TO_SEND" ]] && echo "You must set chat id" && exit 1
        [[ -f /usr/bin/login-notify.sh ]] && echo "Already installed" && exit 1
        cp $0 /usr/bin/login-notify.sh
        chmod +x /usr/bin/login-notify.sh
        echo "session optional pam_exec.so /usr/bin/login-notify.sh" >> /etc/pam.d/system-auth
        exit 0
        ;;
    remove|uninstall)
        sed -i '/login-notify.sh/d' /etc/pam.d/system-auth
        rm /usr/bin/login-notify.sh
        exit 0
        ;;
    *)
        echo "Usage: $0 {install|remove}"
        exit 1
        ;;
esac
fi



# PAM mode

# Do not spam
[[ "$PAM_SERVICE" = "cron" ]] && exit 0
[[ "$PAM_RHOST" =~ "192.168." ]] && exit 0
[[ "$PAM_TYPE" = "close_session" ]] && exit 0

[[ $PAM_TYPE = "open_session" ]] && PAM_TYPE="Login"
[[ $PAM_TYPE = "close_session" ]] && PAM_TYPE="Logout"

message="${HOSTNAME}: $PAM_RHOST $PAM_TYPE <b>$PAM_USER</b> via ${PAM_TTY}"

nohup curl -s                  \
    -X POST              \
    -d text="$message"   \
    -d chat_id=$chatId   \
    -d parse_mode="HTML" \
    https://api.telegram.org/bot$apiToken/sendMessage > /dev/null &
