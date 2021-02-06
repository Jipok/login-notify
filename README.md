# login-notify
![image](https://user-images.githubusercontent.com/25588359/99085862-a1986600-25c0-11eb-94d8-59500d1e1341.png)

Configuration for sending notify to telegram at every login


# Installation
1) `git clone https://github.com/Jipok/login-notify`
2) Using [@BotFather](https://telegram.me/botfather), create a bot
3) In `login-notify.sh` change `apiToken` to value obtained from @BotFather
4) In `login-notify.sh` change `chatId` to valid chat id. Emaple: get your id from [@myidbot](https://telegram.me/myidbot)
4) `make install`

# Tips
* To uninstall run `make uninstall`
* You can also execute commands from the `Makefile` yourself, if you don't have make for some reason.
* You can uncomment 5th line in `login-notify.sh` so as not to receive messages about the session closing
* By default, it does not notify about connections from the local network. See 4th line. 
