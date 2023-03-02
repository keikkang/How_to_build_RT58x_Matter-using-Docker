# How_to_build_RT58x_Matter
Guide Document

  #1. Router Setting

To evaluate the Matter, you need a ROUTER that operates on raspberry pie.
For this Guide I using Raspberry Pi OS Lite 32bit.

![image](https://user-images.githubusercontent.com/108905975/222313699-eda079ed-cd8d-4af6-9258-99a2bfc419f1.png)

1.1 Download the image and burn on SD CARD
The Balena Etcher utility makes it easy to download images to the sd card.
![image](https://user-images.githubusercontent.com/108905975/222315179-07307fe5-afb4-4c35-8e8d-710f6c0a3582.png)

1.2 To activate the default account, Create the file userconf.txt in the root of the boot partition of the uSD card.
    pi:$6$/XOZsG1X0IAbhXB0$wYZHRkvib0SUKQA3KVAxofPR.JsFAbI2NCue2znGvhRsQobVdllFXyQZ7fMSvAoyEj8MfHtkMeSZT7IRIixg01
    
    This mean default ID : pi / PW : raspberry 
    
https://wiki.satnogs.org/Raspberry_Pi#Pre-boot_user_creation

1.3 
```bash
# First you should this command
pi$raspberrypi:sudo apt-get update
pi$raspberrypi:sudo apt install build-essential
pi$raspberrypi:sudo apt install git
```
![image](https://user-images.githubusercontent.com/108905975/222339185-26a8cf27-43ac-4b1f-a125-2af1f052247e.png)

1.4 


