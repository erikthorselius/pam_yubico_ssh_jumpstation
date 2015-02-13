# SSH jumpstation with Yubico pam module
Dockerfile to create a ssh jumpstation.

This Dockerfile is a ssh jumpstation, it supports two step authentication with Yubico OTP as extra security measure. 

## Dependency
* Docker
* Fig

### On mac os x
* Boot2Docker
* Virtualbox

## Build and Run
Create corresponding home directory in ./home and it will be copied in to the container. 

Run 
```
fig build
fig up 
```
Do do not use `fig run` because it won't forward the exposed port. 

## Try it out
run `ssh -i ./path/to/private_key -p 2121 username@locahost`
And you should see a output like
```
$ ssh -p2121 -i .ssh/id_rsa root@192.168.59.103
Authenticated with partial success.
root@192.168.59.103's password:
Last login: Thu Feb 12 21:20:42 2015 from 192.168.59.3
root@2f91a5fd0630:~#
```
