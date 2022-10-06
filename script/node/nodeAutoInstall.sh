#!/bin/bash

# Run package installation
if [[ "$AUTO_INSTALL_PACKAGE" == "TRUE"  ]]; then
    # Empty line
    echo " "
    echo "*************************************************************"
    echo "* Installing dependencies..."
    echo "*************************************************************"
    if [[ "$PACKAGE_MANAGER" == "npm" ]]; then
        npm install
    elif [[ "$PACKAGE_MANAGER" == "yarn" ]]; then
        yarn install
    elif [[ "$PACKAGE_MANAGER" == "pnpm" ]]; then
        pnpm install
    else
        # Empty line
        echo " "
        echo "*************************************************************"
        echo "* Invalid package manager"
        echo "*************************************************************"
        exit 1
    fi
else
    # Empty line
    echo " "
    echo "*************************************************************"
    echo "* Skipping automatic dependencies install..."
    echo "* Change the setting \"AUTO INSTALL PACKAGE\" in Startup tab"
    echo "*************************************************************"
fi