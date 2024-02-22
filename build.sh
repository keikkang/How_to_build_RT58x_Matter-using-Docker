#!/bin/sh

ProjectName=rafael
if [ "$(whoami)" = "root" ]; then
        echo "ERROR: do not use the matter_sdk as root. Exiting..."
        exit 1
fi

echo "Docker shared folder will mount /home/$USER/shared"
letter=/home/$USER

if [ -d $letter ] ;then
        cp Dockerfile Dockerfile_new
        sed -i "/uid /s/30000/$(id -u)/g" Dockerfile_new
        sed -i "s/build1/$(id -nu)/g" Dockerfile_new

        #Create Image
        sudo docker images | grep ${ProjectName}-$(id -nu)>/dev/null;
        if [ $? -ne 0 ]
        then
                sudo docker build -f Dockerfile_new -t ${ProjectName}-$(id -nu):0.0.1 . #example Rafael-kks:0.0.1
        else
                echo "Image ${ProjectName}-$(id -nu) is existed!!!"
        fi

        #Create Container
        sudo docker ps -a | grep ${ProjectName}_$(id -nu)>/dev/null;
        if [ $? -ne 0 ]
        then
                #sudo docker create -p 80:80 -it -v $letter:/home/$(id -nu)/shared --name ${ProjectName}_$(id -nu) ${ProjectName}-$(id -nu):v1 ba$
                sudo docker create -it -v $letter:/home/$(id -nu)/shared --name ${ProjectName}_$(id -nu) ${ProjectName}-$(id -nu):0.0.1 bash
        else
                echo "Container ${ProjectName}_$(id -nu) is existed!!!"
        fi
        rm Dockerfile_new
else
        echo ''$letter' has not existed';
fi

