#!/usr/bin/env bash

cd ../openFramworks/scripts/linux

#Download libraries
sudo ./download_libs.sh
#Download dependancies
sudo ./ubuntu/install_dependencies.sh
#Make link to mesa file
sudo ln -s /usr/lib/x86_64-linux-gnu/libGLX_mesa.so.0 /usr/lib/x86_64-linux-gnu/libGLX_mesa.so
#Install codecs
sudo ./ubuntu/install_codecs.sh
#Compile openframweworks
sudo ./compileOF.sh