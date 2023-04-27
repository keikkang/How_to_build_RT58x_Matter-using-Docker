# How_to_build_RT58x_Matter
###### Guide Document 2023.04.27 

#### 1. How to build edge Applcation
```bash
EC2 AWS Free t2.micro 30GB (Free Tier) 
OS : Ubuntu 20.04 LTS 
```

```bash
# First you should this command
$sudo apt-get update
$sudo apt install build-essential
```

```bash
# Download Source code abd sync submodule package 
$git clone --recurse-submodules https://github.com/RafaelMicro/matter_sdk.git
$cd matter_sdk
$:git submodule update --init
```

```bash
#For build dependencies issue 
$sudo apt-get install git gcc g++ pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev libreadline-dev
```

```bash
#For build enviorment setup 
$source scripts/activate.sh
```
![image](https://user-images.githubusercontent.com/108905975/234737841-d3f9b77e-c987-4378-87e0-f4b5bf4721d0.png)

```bash
$ ./scripts/examples/gn_rt582_example.sh ./examples/<project-name>/rt582 ./out/<project-name>
# Example
$ ./scripts/examples/gn_rt582_example.sh ./examples/lighting-app/rt582 ./out/lighting-app
```
![image](https://user-images.githubusercontent.com/108905975/234745312-15b62236-5a42-4434-a0ad-30bd70818d9e.png)

#### 2. How to burn applcation.bin RT58X devices

To download the applcation image in RT58X, user use IOT EV Tool.

![image](https://user-images.githubusercontent.com/108905975/234778383-0daca2ee-421c-4e8d-b2b6-7aeac31cf55e.png)

※The bootloader is provided on sdk.

### RT58X Binary Image
|N|Name|Description|
|---|---|---|
|1|chip-rt582-lighting-app-example.bin|Matter light|
|2|ot-r582-rcp-uart0.bin|OT-RCP|
|3|bootloader.bin|Bootloader|

#### 3. OTBR Setting

To evaluate the Matter, you need a OTBR that operates on raspberry pi.
For this Guide use pre-build rasp image. To download the os image, users should use the sd card download tool below.

[Download Link](https://www.balena.io/etcher)

##### 3.1 Download the image and burn on SD CARD
The Balena Etcher utility makes it easy to download images to the sd card.

![image](https://user-images.githubusercontent.com/108905975/222315179-07307fe5-afb4-4c35-8e8d-710f6c0a3582.png)


##### 3.2 Raspberry PI4 & Host PC Network enviorment 

![image](https://user-images.githubusercontent.com/108905975/234781096-8fe1ce52-7434-47ce-b026-0d812837b51a.png)

You can access the router home page and find out the IP address of the Raspberry Pi assigned by DHCP

![image](https://user-images.githubusercontent.com/108905975/234781414-c3d55eda-7b35-4f64-a102-5758a75a8fe1.png)

##### 3.3 Connet Raspberry Pi4 via SSH using putty application
```bash
#Default Setting
ID : matter
PW : rafael2023
PORT : 22
```
![image](https://user-images.githubusercontent.com/108905975/234781865-ea4b3323-ca71-4bc7-b52a-1d045c799163.png)

[Putty download link](https://www.putty.org/)

![image](https://user-images.githubusercontent.com/108905975/234782175-939b6e74-f343-42c7-a974-8f9045c99b2a.png)


```bash
#Check RaspberryPiand RCP onnection status. ttyUSB0 is RCP
$ls /dev/tty*
```
![image](https://user-images.githubusercontent.com/108905975/234785313-41d664e4-23bd-4c65-aab2-ed02a2613152.png)

```bash
#Raspberry Pi init

$sudo raspi-config
#Advanced Options -> Expand Filesystem -> OK -> Finish -> Yes

$sudo shutdown -h now
#Reboot Raspberry pi 
```
![image](https://user-images.githubusercontent.com/108905975/234801841-53d85192-6967-4b49-992c-533583596382.png)





   


