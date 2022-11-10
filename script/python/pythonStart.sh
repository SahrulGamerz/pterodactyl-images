#!/bin/bash

# Print current version manager list and environment variable
echo " "
echo "*************************************************************"
echo "* Version"
echo "*************************************************************"
echo "* Python: $(python --version)"
echo "* Pip: $(pip --version)"
echo "* Pipenv: $(pipenv --version)"
echo "*************************************************************"
echo " "
echo "*************************************************************"
echo "* Github Variable"
echo "*************************************************************"
echo "* Github Username: $GITHUB_USERNAME"
echo "* Github Token: $GITHUB_TOKEN (Hide in your screenshot)"
echo "* Repository URL: $GITHUB_REPO"
echo "* Repository Branch: $GITHUB_BRANCH"
echo "* Github Auto Pull: $GIT_AUTO_PULL"
echo "*************************************************************"
echo " "
echo "*************************************************************"
echo "* Optional Variable"
echo "*************************************************************"
echo "* Shell Access: $SHELL_ACCESS"
echo "* Auto Install Package: $AUTO_INSTALL_PACKAGE"
echo "* Skip Overwrite Warning: $SKIP_OVERWRITE_WARNIGN"
echo "*************************************************************"
echo " "
echo "*************************************************************"
echo "* Startup Variable"
echo "*************************************************************"
echo "* Startup Script #1: $STARTUP_SCRIPT_1"
echo "* Startup Script #2: $STARTUP_SCRIPT_2"
echo "*************************************************************"
echo " "
echo "*************************************************************"
echo "* Server Information"
echo "*************************************************************"
echo "* Server IP: $SERVER_IP"
echo "* Server Port: $SERVER_PORT"
echo "* Server Memory: $SERVER_MEMORY MB"
echo "* Server UUID: $P_SERVER_UUID"
echo "* Server Location: $P_SERVER_LOCATION"
echo "*************************************************************"

# Remove temp folder
rm -rf temp

bash -l /github.sh
bash -l /shell.sh
bash -l /pythonAutoInstall.sh

# Run App
echo " "
echo "*************************************************************"
echo "* Starting application..."
echo "*************************************************************"
if [ -f "./Pipfile" ]; then
    script="echo \"${USER}@$(hostname):${HOME}$ ${STARTUP_SCRIPT_1}\"; $STARTUP_SCRIPT_1; echo ' '; echo \"${USER}@$(hostname):${HOME}$ ${STARTUP_SCRIPT_2}\"; $STARTUP_SCRIPT_2; exit 0"
    pipenv shell $script
else
    echo "${USER}@$(hostname):${HOME}$ ${STARTUP_SCRIPT_1}"
    $STARTUP_SCRIPT_1
    echo " "
    echo "${USER}@$(hostname):${HOME}$ ${STARTUP_SCRIPT_2}"
    $STARTUP_SCRIPT_2
fi
echo "*************************************************************"
echo "* Application stopped!"
echo "*************************************************************"