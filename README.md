# ConduiteAlgorithmiqueScripts

Scripts to downlaod and install the openframeworks project used for running Conduite algorithmique

Steps:

1. run `downloadOpenFrameworks.sh`
..* This downloads the custom openframeworks repo and submodules
2. run `compileOpenFrameworks.sh`
..* This runs the openframeworks setup scripts
3. run `installConduiteAlgorithmique.sh`
..* Compiles the Conduite Algorithmique project, adds it to /bin
..* Creates shortcuts on the desktop
..* Adds the application to startup programs 
..** To remove from startup, remove the file in ~/.configure/autostart/)
4. run `ConfigureStartup.sh`
..* Adds commands that are run at startup to turn the computer on and off at specific times
..* Gives wifi priority for internet access
