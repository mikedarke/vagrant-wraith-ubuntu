vagrant-wraith-ubuntu
=====================

Simple Vagrant configuration for running  the BBC's Wraith screenshot comparison tool - https://github.com/BBC-News/wraith

If you are not familiar with Vagrant check it out - http://www.vagrantup.com/

## Usage

Bring up the Vagrant VM
```
vagrant up
```
	
Once Vagrant has initialised and the VM has booted up Wraith should be available in share/wraith. Edit the config.yaml to configure the URL's and screen sizes you want to screenshot.

SSH into the VM
```
vagrant ssh
```
	
Browse to the location of Wraith
```
cd /usr/local/apps/wraith
```
	
Execute rake to begin the test
```
rake
```
	

