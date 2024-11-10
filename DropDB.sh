#!/bin/bash

#--------------------------
# Include Project Modules
#--------------------------
# Source the DBNameUtilities script to access its functions and variables.
source ./DBNameUtilities

#-----------------
# Global Variables
#-----------------
All_DB_Dropped=0


#----------------------
# Functions Definitions
#----------------------

# Function to drop a specific database 
DropSpecificDB() 
{
    clear
    echo "-----------------------------"
    
    # Prompt user for the name of the database to be deleted
    read -p "Enter the Database Name to drop: " DBName
    
    # Check if the specified database exists
    ExistanceDBNameCheck "$DBName" 'd'
    Existflag=$?
    
    # Validate the database name
    validateNameCheck "$DBName" 'd'
    validateflag=$?
    
    # Inform the user if the database does not exist or the name is valid
    if [ "$Existflag" -eq 1 ] && [ "$validateflag" -eq 0 ]; then
        echo "----------------------------------------"
        echo "Database [$DBName] already does not exist!"
        echo "----------------------------------------"
        
    # Delete the database if it exists and the name is valid
    elif [ "$Existflag" -eq 0 ] && [ "$validateflag" -eq 0 ]; then

        # Ask the user to confirm deletion of all databases
        echo "----------------------------------------------"
        echo "Are you sure you want to delete database [$DBName]?"

        # Prompt for confirmation (any key to confirm, [N/n] to cancel)
        read -p "(Press any key to confirm or [N/n] to cancel): " REPLY

        case $REPLY in
            # Cancel the operation if the user presses N or n
            [Nn] | [Nn][Oo] ) 
                echo "-----------------------------------------"
            ;;
            # Otherwise, delete all databases
            * )
                rm -rf "$DBName"
                echo "----------------------------------------"
                echo "Database [$DBName] deleted successfully!"
                echo "----------------------------------------"
                sleep 2
                # read -t 2

            ;;
        esac

        
    fi
}

# Function to drop all databases
DropAllDBs()
{    
    # Ask the user to confirm deletion of all databases
    echo "----------------------------------------------"
    echo "Are you sure you want to delete all databases?"

    # Prompt for confirmation (any key to confirm, [N/n] to cancel)
    read -p "(Press any key to confirm or [N/n] to cancel): " REPLY

    case $REPLY in
        # Cancel the operation if the user presses N or n
        [Nn] | [Nn][Oo] ) 
            echo "-----------------------------------------"
        ;;
        # Otherwise, delete all databases
        * )
            All_DB_Dropped=1
            rm -rf *
            echo "---------------------------------------------"
            echo "All databases have been deleted successfully!"
            echo "---------------------------------------------"
            sleep 2
            # read -t 2

        ;;
    esac
}

# Function to handle database deletion operations
DropDB() 
{
    if [[ -z $(ls -F | grep / | sed 's/\///g') ]]; then
        echo "---------------------------"
        echo "No databases exist to drop!"
        echo "---------------------------"
 
        # Wait for user input with a timeout of 1 second
        read -t 2 -p "Press any key to continue..." REPLY
        clear
    else

        local back=0
        while true
        do
            clear
            echo "-----------------------------------"
            echo "Select an option to drop databases:"
            
            # Provide a menu for the user to choose the type of deletion
            select DropType in All_DBs IndividualDB Back
            do
                case $DropType in
                    # Option to delete all databases
                    'All_DBs' )
                        DropAllDBs
                        break
                    ;;
                    
                    # Option to delete a specific database
                    'IndividualDB' )
                        DropSpecificDB
                        break
                    ;;
                    
                    # Option to return to the previous menu
                    'Back' )
                        back=1
                        break
                    ;;
                    
                    # Handle invalid options
                    *)
                        echo "Invalid selection, please try again."
                        echo "------------------------------------"
                    ;;
                esac
            done
            
            # echo "back=$back ,   All_DB_Dropped=$All_DB_Dropped"
            # If the user selects "Back", exit the loop
            if [ "$back" -eq 1 -o "$All_DB_Dropped" -eq 1 ]; then
                All_DB_Dropped=0
                back=0
                clear
                break
            fi
            
            # Call AskMainMenuReturn and check the result
            AskMainMenuReturn "drop"
            ExitStatus=$?
            
            # Exit the loop if the user does not want to continue with database deletion
            [ "$ExitStatus" -eq 0 ] && break
        done
    fi
}
