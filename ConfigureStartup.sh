#!/usr/bin/env bash

cp ./checkShutdown.sh /home/$USER/checkShutdown.sh
chmod +x /home/$USER/checkShutdown.sh

#Edit sudoers so you don't need password for ifmetric and rtcwake
TMP_STARTUP=/home/$USER/startup
sudo rm -f $TMP_STARTUP
touch $TMP_STARTUP
echo "${USER} ALL= NOPASSWD: /usr/sbin/ifmetric"  | sudo tee -a  $TMP_STARTUP
echo "${USER} ALL= NOPASSWD: /usr/sbin/rtcwake"  | sudo tee -a  $TMP_STARTUP
echo "${USER} ALL= NOPASSWD: /sbin/shutdown"  | sudo tee -a  $TMP_STARTUP
echo "${USER} ALL= NOPASSWD: /usr/bin/at"  | sudo tee -a  $TMP_STARTUP
echo "${USER} ALL= NOPASSWD: /usr/bin/atq"  | sudo tee -a  $TMP_STARTUP
echo "${USER} ALL= NOPASSWD: /usr/bin/atrm"  | sudo tee -a  $TMP_STARTUP

sudo visudo -c -f $TMP_STARTUP
VALID=$?

if [ $VALID = 0 ]
then
    echo "Startup script is valid"
    chmod 0440 $TMP_STARTUP
    sudo rm -f /etc/sudoers.d/startup
    sudo cp $TMP_STARTUP /etc/sudoers.d/startup
else
    echo "startup sudoers script is not valid -fix it"
fi

#Create rc.local file (commands to run on startup)
RC_LOCAL=/etc/rc.local
STARTUP_LOG=/home/$USER/startup.log
TMP_TIME=$PWD/startupShutdown
TIME_SETTINGS_FILE=/home/$USER/startupShutdown
cp $TMP_TIME $TIME_SETTINGS_FILE

sudo rm -f $RC_LOCAL
sudo touch $RC_LOCAL
echo "#!/bin/bash"  | sudo tee -a  $RC_LOCAL
echo 'sudo ifmetric wlp6s0 50' | sudo tee -a $RC_LOCAL

#Read times from settings file
echo "mapfile -t times < $TIME_SETTINGS_FILE" | sudo tee -a $RC_LOCAL
echo "sudo rtcwake -m no -l -t \`date +%s -d \"tomorrow \${times[0]}\"\`" | sudo tee -a $RC_LOCAL
echo "at -f /home/$USER/closeAndShutdown.sh \${times[1]} today" | sudo tee -a $RC_LOCAL

#Log to startup.log
echo "rm -rf ~/.conduite/supervise"| sudo tee -a $RC_LOCAL
echo "rm -f $STARTUP_LOG"| sudo tee -a $RC_LOCAL
echo "touch $STARTUP_LOG"| sudo tee -a $RC_LOCAL
echo "route -n >> $STARTUP_LOG"| sudo tee -a $RC_LOCAL
echo "sudo rtcwake -m show >> $STARTUP_LOG"| sudo tee -a $RC_LOCAL
echo "/home/$USER/checkShutdown.sh >> $STARTUP_LOG"| sudo tee -a $RC_LOCAL
sudo chmod +x $RC_LOCAL



