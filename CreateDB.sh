#!/bin/bash

#--------------------------
# Include Project Modules
#--------------------------
# Source the DBNameUtilities script to access its functions and variables.
source ./DBNameUtilities

# Function to create a database
CreateDB(){
    # Infinite loop to handle database creation
    while true
    do
        clear
        echo "----------------------------------"
        # Prompt the user to enter the name of the database they want to create
        read -p "Enter the Database Name to create: " DBName
        
       # Check if the specified database exists
        ExistanceDBNameCheck "$DBName" 'd'
        Existflag=$?
        # echo Existflag: $Existflag
        
        # Validate the database name
        validateNameCheck "$DBName" 'd'
        validateflag=$?
        # echo validateflag: $validateflag
        
        # If the database exists and the name is valid, inform the user
        if [ "$Existflag" -eq 0 ] && [ "$validateflag" -eq 0 ]; then
            echo "Database [$DBName] already exists!"
            echo "-----------------------------------------"
        # If the database does not exist and the name is valid, create the database directory
        elif [ "$Existflag" -eq 1 ] && [ "$validateflag" -eq 0 ]; then
            # Create the database directory
            mkdir $DBName
            echo "Database [$DBName] created successfully!"
            echo "-----------------------------------------"
        fi

        # Call AskMainMenuReturn and check the result
        AskMainMenuReturn "create"
        ExitStatus=$?

        # Exit the loop if user does not want to create more databases
        [ "$ExitStatus" -eq 0 ] &&  break
 
    done
}