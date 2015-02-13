# pam_yubico_ssh_jumpstation
Dockerfile to create a ssh jumpstation with two-step authentication

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
fig up (not run then it wont forward the ssh port)
```

## Try it out
run `ssh -i ./path/to/private_key -p 2121 root@locahost`
