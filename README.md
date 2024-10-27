# login-notify
![image](https://user-images.githubusercontent.com/25588359/99085862-a1986600-25c0-11eb-94d8-59500d1e1341.png)

PAM module for Telegram login alerts


# Installation
1) `wget https://raw.githubusercontent.com/Jipok/login-notify/refs/heads/master/login-notify.sh`
2) `chmod +x login-notify.sh`
3) Using [@BotFather](https://telegram.me/botfather) create a bot
4) In `login-notify.sh` change `apiToken` to value obtained from @BotFather
5) In `login-notify.sh` change `chatId` to valid chat id. Example: get your id from [@myidbot](https://telegram.me/myidbot)
6) `./login-notify.sh install`

# Tips
* Uninstall with `login-notify.sh uninstall`
* By default, it does not notify about closing a session. See 37th line.
* By default, it does not notify about connections from the local network. See 36th line. 
* Should work on any normal Linux distribution(Arch, Debian, Void, Fedora, etc).
