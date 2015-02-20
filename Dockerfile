FROM phusion/baseimage:0.9.16
RUN rm -f /etc/service/sshd/down
RUN apt-get update && apt-get install libpam-yubico -y
ADD *.sh /tmp/
ADD home /tmp/home
RUN /tmp/append_sshd_config.sh && \
/tmp/change_ssh_pem.sh && \
/tmp/add_users.sh && \
rm -rf /tmp
EXPOSE 22
CMD ["/sbin/my_init"]
