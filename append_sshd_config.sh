#!/usr/bin/env bash
cat <<EOT >> /etc/ssh/sshd_config
ChallengeResponseAuthentication no 
PasswordAuthentication no
UsePAM yes
Match Group yubico 
  PasswordAuthentication yes
  AuthenticationMethods publickey,password
EOT
