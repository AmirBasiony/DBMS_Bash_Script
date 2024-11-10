#!/bin/bash

listDB(){
    clear
    echo "|--------------------|"
    
    # Check if there are any directories (databases) to list
    if [[ -z $(ls -F | grep / | sed 's/\///g') ]]; then
        echo "|No databases found! |"
    else
    
        echo "| Existing databases |"
        echo "|--------------------|"
        # List all directories (databases) without trailing slashes

        # ls -F                         #-------------> lists files and directories.
        # grep /                        #-------------> filters out only directories.
        # sed 's/\///g'                 #-------------> removes the trailing / from directory names.
        # awk '{printf "\t%s\n", $0}'   #-------------> adds a tab character before each directory name.
        ls -F | grep / | sed 's/\///g' | awk '{printf "\t%s\n", $0}'

    fi
    echo "|--------------------|"    
}
