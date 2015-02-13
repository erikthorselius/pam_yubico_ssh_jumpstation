# SSH jumpstation with Yubico pam module
Dockerfile to create a ssh jumpstation with two-step authentication. First out is the authentication and the nextstep is to use it as a jumpstation into the rest of the network. 

A Dockerfile with SSH. Two step authentication is activated, so a user need both a private key and a Yubico OTP as a extra security measure.  

## Dependency
* Docker
* Fig
### On mac os x
* Boot2Docker
* Virtualbox

## Build and Run
Copy the public files to the same folder as the Dockerfile.
Create yubikey file as the example file.
Run 
```
fig build
fig up 
```
Do do not use `fig run` because it won't forward the exposed port. 

## Try it out
run `ssh -i ./path/to/private_key -p 2121 root@locahost`
And you should see a output like
```
$ ssh -p2121 -i .ssh/id_rsa root@192.168.59.103
Authenticated with partial success.
root@192.168.59.103's password:
Last login: Thu Feb 12 21:20:42 2015 from 192.168.59.3
root@2f91a5fd0630:~#
```
