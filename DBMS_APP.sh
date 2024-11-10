#!/bin/bash

#--------------------------
# Enabling Alias Expansion
#--------------------------
# Enable the use of aliases within scripts
shopt -s expand_aliases
# Define an alias 'include' to source scripts
alias include='source'

# Enable extended globbing for advanced pattern matching
shopt -s extglob

#--------------------------
# Including Project Modules
#--------------------------
# Source the scripts to access functions and variables defined there.
source ./CreateDB.sh
source ./listDB.sh
source ./DropDB.sh
source ./ConnectDB.sh


#---------------------------------------------------------------------
# Initialize flags for controlling the loop and simulating user input.
#---------------------------------------------------------------------
exitflag=0
beginloop=0


#-----------------------
# Project Setup Function
#-----------------------
Setup()
{
    # List all directories (databases) and store their names in the DBNames array.
    # If no databases are found, create a DBMS directory and change to it.
    DBNames=($(ls -F | grep / | sed 's/\///g'))
    [ ${#DBNames[@]} -eq "0" ] && mkdir DBMS
    cd DBMS/

    # Display a welcome message with a heart symbol.
    echo -e "\t\u2665Welcome, $USER, to the Database Management System!\u2665"
}

#------------------
# Project Main Loop
#------------------

#Calling Project Setup function
Setup

# Start the main loop for handling user operations.
while true
do    
    # Check if the exit flag is set, and if so, display a goodbye message and break the loop.
    if [ $exitflag = '1' ]; then
        echo -e  "----------------------"
        echo -e "\u2665GoodBye, $USER\u2665"
        echo -e  "----------------------"
        break
    fi
    
    # Simulate pressing 'Enter' once at the start of the loop, unless beginloop is 0.
    (( $beginloop != 0 )) && read input_variable <<< "" || (( beginloop++ ))
    
    echo -e  "\n---------------------------------------------"
    # Prompt the user to select an option from the menu
    echo "Please, select an option from the following: "
    echo -e  "---------------------------------------------"
    # Present a menu of operations for the user to choose from
    select operation in CreateDB listDB DropDB ConnectDB Exit
    do    
        # Execute the selected operation based on user choice.
        case $operation in
            'CreateDB' )
                CreateDB   # Call the CreateDB function to handle database creation.
                break
            ;;
            'listDB' )
                listDB     # Call the listDB function to list available databases.
                break
            ;;
            'DropDB' )
                DropDB     # Call the DropDB function to handle database deletion.
                break
            ;;
            'ConnectDB' )
                ConnectDB  # Call the ConnectDB function to connect to a database.
                break
            ;;
            'Exit' )
                exitflag=1  # Set the exit flag to 1 to terminate the main loop.
                break
            ;;
            # Handle invalid options
            *)
                echo "Invalid selection, please try again."
                echo "------------------------------------"
        esac
    done
done
