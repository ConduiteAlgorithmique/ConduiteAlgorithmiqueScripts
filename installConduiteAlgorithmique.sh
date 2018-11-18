#!/usr/bin/env bash



timefile=$PWD/startupShutdown
cp $timefile ~/


SHORTCUT=~/Desktop/StartupShutdownSettings.desktop
touch ${SHORTCUT}
cat > ${SHORTCUT} << EOL
[Desktop Entry]
Name=Computer On/Off times
Exec=bash -c 'gedit ~/startupShutdown'
Type=Application
Terminal=false
Icon=preferences-system
EOL
chmod u+x ${SHORTCUT}
sudo chown nuc:nuc ${SHORTCUT}

shutdownscript=$PWD/closeAndShutdown.sh
chmod +x $shutdownscript
cp $shutdownscript ~/
SHORTCUT=~/Desktop/Shutdown.desktop	

#Todo make icon
touch ${SHORTCUT}
cat > ${SHORTCUT} << EOL
[Desktop Entry]
Name=Shutdown
Exec=bash -c '~/closeAndShutdown.sh'
Type=Application
Terminal=false
Icon=/usr/share/icons/ubuntu-mono-light/actions/24/system-shutdown-panel-restart.svg
EOL
chmod u+x ${SHORTCUT}
sudo chown nuc:nuc ${SHORTCUT}

cd ../openFrameworks/apps/myApps/ConduiteAlgorithmique
make

conduite_exe=$PWD/bin/ConduiteAlgorithmique
sudo rm /usr/bin/ConduiteAlgorithmique
sudo ln -s ${conduite_exe} /usr/bin/ConduiteAlgorithmique

SHORTCUT=~/Desktop/ConduiteAlgorithmique.desktop
touch ${SHORTCUT}
cat > ${SHORTCUT} << EOL
[Desktop Entry]
Name=Run Conduite Algorithmique
Exec=bash -c 'ConduiteAlgorithmique;$SHELL'
Type=Application
Terminal=true
Icon=/usr/share/icons/Humanity/actions/48/player_play.svg
EOL
chmod u+x ${SHORTCUT}
sudo chown nuc:nuc ${SHORTCUT}

SHORTCUT=~/Desktop/ConduiteAlgorithmique_Settings.desktop
settingsfile=$PWD/bin/data/settings.json
#Todo make icon
touch ${SHORTCUT}
cat > ${SHORTCUT} << EOL
[Desktop Entry]
Name=Conduite Settings
Exec=bash -c 'gedit ${settingsfile}'
Type=Application
Terminal=false
Icon=preferences-system
EOL
chmod u+x ${SHORTCUT}
sudo chown nuc:nuc ${SHORTCUT}



