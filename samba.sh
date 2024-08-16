#!/bin/bash

apt update 
hostnamectl set-hostname ad.cdpni.sap
apt install openssh-server nfs-client samba krb5-config winbind krb5-user smbclient -y
cp -v /root/samba/etc/* /etc/
	systemctl restart networking sshd
	chattr +i /etc/resolv.conf
 mv /etc/samba/smb.conf smb.conf.old
 samba-tool domain provision --use-rfc2307 --interactive
	systemctl stop smbd nmbd winbind
	systemctl disable smbd nmbd winbind
	systemctl unmask samba-ad-dc
	systemctl start samba-ad-dc
	systemctl enable samba-ad-dc
	



