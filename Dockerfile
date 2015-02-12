FROM phusion/baseimage:0.9.16
RUN rm -f /etc/service/sshd/down
RUN apt-get update && apt-get install libpam-yubico -y
ADD *.pub *.yubikey /tmp/
RUN cat /tmp/*.pub >> /root/.ssh/authorized_keys && rm -f /tmp/*.pub && \
mkdir /root/.yubico && cat /tmp/*.yubikey >> /root/.yubico/authorized_yubikeys && rm /tmp/*.yubikey && \
echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config && \ 
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
echo "UsePAM yes" >> /etc/ssh/sshd_config && \
echo "Match User root" >> /etc/ssh/sshd_config && \
echo "  PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
echo "  AuthenticationMethods publickey,password" >> /etc/ssh/sshd_config && \
echo "auth required pam_yubico.so id=16" > /etc/pam.d/sshd
EXPOSE 22
CMD ["/sbin/my_init"]
