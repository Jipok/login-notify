install:
	install -m +x ./login-notify.sh /usr/bin/
	install ./login-notify /usr/share/pam-configs/
	pam-auth-update --enable login-notify

uninstall:
	pam-auth-update --remove login-notify
	rm /usr/share/pam-configs/login-notify
	rm /usr/bin/login-notify.sh
