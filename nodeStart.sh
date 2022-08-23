#!/bin/bash

# Empty line
echo " "

# Output Current Script | Node | NPM Version
echo "*************************************************************"
echo "Script: "$(script -V)
echo "Node: "$(node -v)
echo "NPM: "$(npm -v)
echo "*************************************************************"

# Empty line
echo " "

# Output Current Settings
echo "*************************************************************"
echo "Github Username: $GITHUB_USERNAME"
echo "Github Token: $GITHUB_TOKEN (Please hide this in your screenshot)"
echo "Repository URL: $GITHUB_REPO"
echo "Repository Branch: $GITHUB_BRANCH"
echo "Github Auto Pull: $GIT_AUTO_PULL"
echo "Shell Access: $SHELL_ACCESS"
echo "Package Manager: $PACKAGE_MANAGER"
echo "Auto Install Package: $AUTO_INSTALL_PACKAGE"
echo "Node Startup Script #1: $NODE_STARTUP_SCRIPT_1"
echo "Node Startup Script #2: $NODE_STARTUP_SCRIPT_2"
echo "*************************************************************"

# Remove temp folder
rm -rf temp

# Fetch repository
if [[ "$GIT_AUTO_PULL" == "true" ]]; then
    if [[ "$GITHUB_USERNAME" == "" ]]; then
        # Empty line
        echo " "
        echo "*************************************************************"
        echo "Missing Github Username: $GITHUB_USERNAME"
        echo "*************************************************************"
        exit 1
    fi
    if [[ "$GITHUB_TOKEN" == "" ]]; then
        # Empty line
        echo " "
        echo "*************************************************************"
        echo "Missing Github Token: $GITHUB_TOKEN"
        echo "*************************************************************"
        exit 1
    fi
    if [[ "$GITHUB_REPO" == "" ]]; then
        # Empty line
        echo " "
        echo "*************************************************************"
        echo "Missing Github Repo: $GITHUB_REPO"
        echo "*************************************************************"
        exit 1
    fi
    if [[ "$GITHUB_BRANCH" == "" ]]; then
        # Empty line
        echo " "
        echo "*************************************************************"
        echo "Missing Github Branch: $GITHUB_BRANCH"
        echo "*************************************************************"
        exit 1
    fi

    if [[ -d "/home/container/.git" ]]; then
        # Empty line
        echo " "
        echo "*************************************************************"
        echo "Found .git folder. Pulling from existing repository..."
        echo "Any changes made directly to this folder and subfolder will be lost!"
        echo "*************************************************************"
        git pull --progress
    else 
        # Empty line
        echo " "
        echo "*************************************************************"
        echo "Pulling repository..."
        echo "Any changes made directly to this folder and subfolder will be lost!"
        echo "*************************************************************"
        GITHUB_REPO = ${GITHUB_REPO#*//}
        GITHUB_REPO = ${GITHUB_REPO#*//}
        if [[ $GITHUB_REPO = *.git ]]; then
            git clone --progress "https://$GITHUB_USERNAME:$GITHUB_TOKEN@$GITHUB_REPO" temp
        else
            git clone --progress "https://$GITHUB_USERNAME:$GITHUB_TOKEN@$GITHUB_REPO.git" temp
        fi
        
        for x in temp/* temp/.[!.]* temp/..?*; do
            if [ -e "$x" ]; then mv -- "$x" ./; fi
        done
    fi
fi

# Empty line
echo " "

# Run Shell
if [[ "$SHELL_ACCESS" == "true"  ]]; then
    bash /shell.sh
fi

# Empty line
echo " "

# Run package installation
if [[ "$AUTO_INSTALL_PACKAGE" == "true"  ]]; then
    if [[ "$PACKAGE_MANAGER" == "npm" ]]; then
        npm install
    elif [[ "$PACKAGE_MANAGER" == "yarn" ]]; then
        yarn install
    elif [[ "$PACKAGE_MANAGER" == "pnpm" ]]; then
        pnpm install
    else
        echo "Invalid package manager"
        exit 1
    fi
fi

# Empty line
echo " "

# Run App
$NODE_STARTUP_SCRIPT_1

# Empty line
echo " "

$NODE_STARTUP_SCRIPT_2