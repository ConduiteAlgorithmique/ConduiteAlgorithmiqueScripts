#!/usr/bin/env bash

cd ../openFrameworks/apps/myApps/ConduiteAlgorithmique
make

conduite_exe=$PWD/bin/ConduiteAlgorithmique
sudo rm /usr/bin/ConduiteAlgorithmique
sudo ln -s ${conduite_exe} /usr/bin/ConduiteAlgorithmique

SHORTCUT=~/Desktop/ConduiteAlgorithmique.desktop
ICON=$PWD/icon.png

#Todo make icon
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