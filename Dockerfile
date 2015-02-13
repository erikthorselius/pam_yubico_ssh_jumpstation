FROM phusion/baseimage:0.9.16
RUN rm -f /etc/service/sshd/down
RUN apt-get update && apt-get install libpam-yubico -y
ADD *.sh /tmp/
ADD home /tmp/home
RUN /tmp/create_ssh_jumpstation.sh
EXPOSE 22
CMD ["/sbin/my_init"]
