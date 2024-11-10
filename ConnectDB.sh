#!/bin/bash

#--------------------------
# Include Project Modules
#--------------------------
# Source the Utilities script to access its functions and variables.
source ./DBNameUtilities
source ./DBTableUtilities
ConnectDB()
{
    if [[ -z $(ls -F | grep / | sed 's/\///g') ]]; then
    echo "------------------------------"
    echo "No databases exist to connect!"
    echo "------------------------------"

    # Wait for user input with a timeout of 1 second
    read -t 2 -p "Press any key to continue..." REPLY
    clear
    else
        while true
        do
            clear
            echo "----------------------------------"
            # Prompt the user to enter the name of the database they want to create
            read -p "Enter the Database Name to connect: " DBName
            
            # Check if the specified database exists
            ExistanceDBNameCheck "$DBName" 'd'
            Existflag=$?
            # echo Existflag: $Existflag
            
            # Validate the database name
            validateNameCheck "$DBName" 'd'
            validateflag=$?
            #   : $validateflag

            # If the database exists and the name is valid, inform the user
            if [ "$Existflag" -eq 0 ] && [ "$validateflag" -eq 0 ]; then
                cd $DBName
                TableOperationsMenu 
                cd ../
            elif [ "$Existflag" -eq 1 ] && [ "$validateflag" -eq 0 ]; then
                echo "--------------------------------------" 
                echo "There is no database called '$DBName'!"
           fi

            echo "---------------------------------------------"
            # Call AskMainMenuReturn and check the result
            AskMainMenuReturn "connect with"
            ExitStatus=$?

            # Exit the loop if user does not want to create more databases
            [ "$ExitStatus" -eq 0 ] &&  break
        done    
    fi
}