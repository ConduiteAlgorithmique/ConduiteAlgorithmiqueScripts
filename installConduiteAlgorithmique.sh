#!/usr/bin/env bash


SHORTCUT=~/Desktop/StartupShutdownSettings.desktop
timefile=$PWD/startupShutdown

#Todo make icon
touch ${SHORTCUT}
cat > ${SHORTCUT} << EOL
[Desktop Entry]
Name=Computer On/Off times
Exec=bash -c 'gedit ${timefile}'
Type=Application
Terminal=false
Icon=preferences-system
EOL
chmod u+x ${SHORTCUT}

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
Icon=utilities-terminal
EOL
chmod u+x ${SHORTCUT}
cp $SHORTCUT ~/.config/autostart/

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





