#!/usr/bin/env bash
addgroup yubico
cat <<EOT >> /etc/ssh/sshd_config
ChallengeResponseAuthentication no 
PasswordAuthentication no
UsePAM yes
Match Group yubico 
  PasswordAuthentication yes
  AuthenticationMethods publickey,password
EOT
echo "auth required pam_yubico.so id=16"> /etc/pam.d/sshd
for D in "/tmp/home/"*; do
    if [ -d "${D}" ]; then
        username=$(basename "$D")   
        $(useradd $username -s /bin/bash -m)
        $(cp -r /tmp/home/$username/. /home/$username)
        passwd -u $username 2>/dev/null 
        chown -R $username:$username /home/$username
        if [ -r /home/$username/.yubico/authorized_yubikeys ]; then
          usermod -a -G yubico $username
        fi;
    fi
done
rm -rf /tmp/home
