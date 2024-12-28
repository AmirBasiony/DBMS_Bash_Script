## Bash Shell Script Database Management System (DBMS)

This project implements a Bash Shell Script Database Management System (DBMS) that enables users to store and retrieve data from their hard disk. The system simulates a simple DBMS with basic operations like creating databases and tables, inserting records, and retrieving, updating, and deleting data.

### Features

#### Main Menu
The application provides a Command-Line Interface (CLI) menu with the following options:
- **Create Database**: Create a new database (directory) inside the DBMS directory.
- **List Databases**: List all existing databases (directories) inside the DBMS directory.
- **Connect to Database**: Connect to a specific database to perform operations like table creation and data manipulation.
- **Drop Database**: Delete an existing database (directory) and all associated tables.
  
#### Database Operations (After Connection)
Once connected to a specific database, the system presents the following menu for table-related operations:
- **Create Table**: Create a new table inside the connected database.
- **List Tables**: List all tables (files) inside the connected database.
- **Drop Table**: Delete a table (file) from the connected database.
- **Insert into Table**: Insert records into a table.
- **Select from Table**: This option retrieves records from a table and allows you to display specific rows, columns, or the entire table content.
- **Delete from Table**: Delete specific records or all records from a table.
- **Update Table**: Modify existing records in a table.

### Key Features
- **Data Storage**: Databases are stored as directories within a main DBMS directory. Each database is represented as a folder, and tables are stored as text files inside the respective database folder.
- **Formatted Output**: Select queries and display results in a readable format.
- **Column Data Types**: During table creation, the script asks for column data types (e.g., int, string) and checks for correct types during insert and update operations.
- **Primary Key**: The user can define one or more primary keys during table creation. At least one primary key is required, and it will be automatically set during table creation. If the user specifies multiple primary keys, the script allows it.

### CRUD Operations Handling
This DBMS project handles all basic CRUD operations (Create, Read, Update, Delete) for databases and tables:
- **Create**: Create new databases (directories) and tables (text files) with specific column data types.
- **Insert**: Insert new records into tables after ensuring proper data types and primary key constraints.
- **Read**: Retrieve and display records from tables with formatted output for easy readability.
- **Update**: Modify existing table records while ensuring data type consistency and primary key integrity.
- **Delete**: Remove specific records or all records from a table. Drop entire tables or databases (directories) if no longer needed.

### Project Setup
1. **Clone the Repository**: Clone or download the repository to your machine using the following command in your terminal:
  ```bash
   git clone https://github.com/AmirBasiony/DBMS_Bash_Script.git
   cd DBMS_Bash_Script/
   ```
2. **Run the Script**: To start the DBMS, run the following command in your terminal:

   ```bash
   bash DBMS_APP.sh
   ```
---

### Example Directory Structure

Before running the `DBMS_APP.sh` script:
```bash
.
├── ConnectDB.sh
├── CreateDB.sh
├── DBMS_APP.sh
├── DBNameUtilities
├── DBTableUtilities
├── DropDB.sh
├── listDB.sh
└── README.md
```

After running the script, the directory structure will be:
```bash
├── ConnectDB.sh
├── CreateDB.sh
├── DBMS
│   └── (Database directories)
├── DBMS_APP.sh
├── DBNameUtilities
├── DBTableUtilities
├── DropDB.sh
├── listDB.sh
└── README.md
```
---

#### Directory Operations Breakdown:

-  **DBMS/**: The main directory where all databases are stored.
-  **MyDatabase/**: A directory representing a database, containing tables as text files.
-  **FirstTable.txt, SecondTable.txt**: Text files representing tables inside the `MyDatabase` directory. Each row in these text files represents a record.

---

### User Interaction Example

Upon running the script, the user will be presented with a menu in the terminal:

```sql
♥Welcome, amir, to the Database Management System!♥

---------------------------------------------
Please, select an option from the following:
---------------------------------------------
1) CreateDB
2) listDB
3) DropDB
4) ConnectDB
5) Exit
#? 1
----------------------------------
Enter the Database Name to create: Amir
Database [Amir] created successfully!
-----------------------------------------
Would you like to create another database?
(Press any key to continue or [N/n] to cancel): 
```

Once databases are created, the user can:
- **List Databases**:
  ```sql
  |--------------------|
  | Existing databases |
  |--------------------|
      Amir
  |--------------------|
  ```
- **Drop Databases**:
  ```sql
  Enter the Database Name to drop: Amir
  ----------------------------------------------
  Are you sure you want to delete database [Amir]?
  (Press any key to confirm or [N/n] to cancel):
  ----------------------------------------
  Database [Amir] deleted successfully!
  ----------------------------------------
  ```

- **Connect to Databases**:
  ```sql
  Enter the Database Name to connect: Amir
  ---------------------------------------------
  Please, select an option from the following: 
  ---------------------------------------------
  1) Create table
  2) Insert into table
  3) List tables
  4) Drop table
  5) Select from table
  6) Update from table
  7) Delete from table
  8) Back
  #? 
  ```
---

#### Example of Creating a Table

- **Creating Table with Valid and Invalid Names**:

```sql
----------------------------------------
Enter the Database Table Name to create: as
|---------------------------------------------------------------------------------|
| WARNING: Database table names must adhere to the following rules:               |
| 1. Must be at least 3 characters long.                                          |
| 2. Only uppercase (A-Z) and lowercase (a-z) letters are allowed.                |
| 3. No digits, spaces, or special characters (!, @, #, $, %, etc.) are permitted.|
|---------------------------------------------------------------------------------|
Would you like to create another database table?
(Press any key to continue or [N/n] to cancel): 
```

```sql
----------------------------------------
Enter the Database Table Name to create: ma*#med
|---------------------------------------------------------------------------------|
| WARNING: Database table names must adhere to the following rules:               |
| 1. Must be at least 3 characters long.                                          |
| 2. Only uppercase (A-Z) and lowercase (a-z) letters are allowed.                |
| 3. No digits, spaces, or special characters (!, @, #, $, %, etc.) are permitted.|
|---------------------------------------------------------------------------------|
Would you like to create another database table?
(Press any key to continue or [N/n] to cancel): 
```

```sql
----------------------------------------------
Enter the Database Table Name to create: Table
----------------------------------------------
Enter number of fields in [Table] table: 3
----------------------------------------------------------------
Field [1] is the ID, an integer, and serves as the primary key.
----------------------------------------------------------------

Please select the data type for field [2]:
-------------------------------------------
1) String
2) Integer
#? 1
--------------------------------
Enter the field name: as
|---------------------------------------------------------------------------------|
| WARNING: Database field names must adhere to the following rules:               |
| 1. Must be at least 3 characters long.                                          |
| 2. Only uppercase (A-Z) and lowercase (a-z) letters are allowed.                |
| 3. No digits, spaces, or special characters (!, @, #, $, %, etc.) are permitted.|
|---------------------------------------------------------------------------------|
--------------------------------
Enter the field name: username
-------------------------------------------------------------------
Would you like the field 'username' to be set as the primary key?
1) Yes
2) No
#? 2
------------------------------------------------------------
Field [2]: 'username' has been added successfully.
------------------------------------------------------------

Please select the data type for field [3]:
-------------------------------------------
1) String
2) Integer
#? 23
Invalid selection, please try again.
------------------------------------
#? 2
--------------------------------
Enter the field name: age2
|---------------------------------------------------------------------------------|
| WARNING: Database field names must adhere to the following rules:               |
| 1. Must be at least 3 characters long.                                          |
| 2. Only uppercase (A-Z) and lowercase (a-z) letters are allowed.                |
| 3. No digits, spaces, or special characters (!, @, #, $, %, etc.) are permitted.|
|---------------------------------------------------------------------------------|
--------------------------------
Enter the field name: age
-------------------------------------------------------------------
Would you like the field 'age' to be set as the primary key?
1) Yes
2) No
#? 2
------------------------------------------------------------
Field [3]: 'age' has been added successfully.
------------------------------------------------------------

------------------------------------------------------------
All fields of the table 'Table' have been added successfully.
------------------------------------------------------------
Field Names   : ID:username:age
Field Types   : int:string:int
Primary Keys  : Yes:No:No
------------------------------------------------------------
Database table [Table] created successfully!
---------------------------------------------
Would you like to create another database table?
(Press any key to continue or [N/n] to cancel): 
```
---

#### Example of Inserting Records into a Table

```sql
----------------------------------------
Enter the Database Table Name to insert a record: Table
----------------------------------------------
Field [1]: Enter 'ID' in 'Table' table as a 'Primary key': amir
|---------------------------------------------------|
| WARNING: you must enter integer numbers only (0-9)|
|---------------------------------------------------|
Field [1]: Enter 'ID' in 'Table' table as a 'Primary key': 1
Field [2]: Would you like to enter a record in 'username' field?
1) Yes
2) No
#? 1
Field [2]: Enter 'username' in 'Table' table: amir
Field [3]: Would you like to enter a record in 'age' field?
1) Yes
2) No
#? 1
Field [3]: Enter 'age' in 'Table' table: 24
----------------------------------------------------------
All records of the table 'Table' have been inserted successfully.
[Inserted Record]: 1:amir:24
----------------------------------------------------------
Would you like to insert another database record into 'Table' table?
(Press any key to continue or [N/n] to cancel): 
```
---

#### Example of Selecting Records from a Table

```sql
---------------------------------------------
Please, select an option from the following: 
---------------------------------------------
1) Select all Table
2) Select specific column
3) Select specific record


4) Back
#? 1
--------------------------------------------
Data from table [Table] has been selected:
--------------------------------------------
ID  | username | age
--------------------
1   | amir     | 24
--------------------
--------------------------------------------
Would you like to select another record from 'Table' table?
(Press any key to continue or [N/n] to cancel): 
```
---

#### Example of Updating Records from a Table

Once the user selects "Update from table", the following process occurs:

```bash
---------------------------------------------
Please, select an option from the following: 
---------------------------------------------
1) Create table
2) Insert tables
3) List table
4) Drop table
5) Select from table
6) Update from table
7) Delete from table
8) Back
#? 6
----------------------------------------
Enter the Database Table Name to update: Table
---------------------------------------------------
Enter the record 'ID' in table 'Table': 13
|-----------------------------------|
| Record with ID '13' not found!   |
|-----------------------------------|

---------------------------------------------------
Enter the record 'ID' in table 'Table': 1
-------------------------------------------------
Please, select a field name  from the following: 
-------------------------------------------------
1) ID
2) username
3) age
4) Back
#? 1
-------------------------------------------------
Please, select a field name  from the following: 
-------------------------------------------------
1) ID
2) username
3) age
4) Back
#? 1
|---------------------------------------------------------|
| WARNING: The primary key field 'ID' cannot be updated.  |
|          Please choose a different field to update.     |
|---------------------------------------------------------|
Would you like to update another field in  'Table' table?
(Press any key to continue or [N/n] to cancel): 

-------------------------------------------------
Please, select a field name  from the following: 
-------------------------------------------------
1) ID
2) username
3) age
4) Back
#? 2
-----------------------------------------------------------
Would you like to enter a new value for 'username'?
1) Yes
2) No
#? 1
-----------------------------------------------------------
Enter new value for 'username': Karim
--------------------------------------------------------
Record's field of table 'Table' has been updated successfully.
[Updated Record]: 1:Karim:24
--------------------------------------------------------
Would you like to update any record from  'Table' table?
(Press any key to continue or [N/n] to cancel): 
```


#### Checking the Updated Table Field

Once the update operation is complete, the user can verify the updated data by selecting from the table:

```bash
---------------------------------------------
Please, select an option from the following: 
---------------------------------------------
1) Create table
2) Insert tables
3) List table
4) Drop table
5) Select from table
6) Update from table
7) Delete from table
8) Back
#? 5
----------------------------------------
Enter the Database Table Name to select from table: Table

---------------------------------------------
Please, select an option from the following: 
---------------------------------------------
1) Select all Table
2) Select specific column
3) Select specific record
4) Back
#? 1
-----------------------------------------------
displaying all records from the table 'Table'.
-----------------------------------------------
1:Karim:24
2:ahmed:-
---------------------------------------------
```
---

#### Example of Deleting Records from a Table

Once the user selects "Delete from table", the following process occurs:

```bash
---------------------------------------------
Please, select an option from the following: 
---------------------------------------------
1) Create table
2) Insert tables
3) List table
4) Drop table
5) Select from table
6) Update from table
7) Delete from table
8) Back
#? 7

----------------------------------------
Enter the Database Table Name to delete: Table
---------------------------------------------------
Select an option to delete from the database table:
1) Delete All Records from Table
2) Delete Specific Record from Table
3) Back
#? 2
------------------------------------------
Enter the record 'ID' in table 'Table': 15
----------------------------------------------------------------
The Record with ID '15' does not exist in table 'Table'!
----------------------------------------------------------------
Would you like to delete another record from 'Table' table?
(Press any key to continue or [N/n] to cancel): 
------------------------------------------
Enter the record 'ID' in table 'Table': 2
----------------------------------------------------
Are you sure you want to delete the record with ID '2' from table 'Table'?
(Press any key to confirm or [N/n] to cancel): 
-------------------------------------------------------------------------
The Record with ID '2' has been deleted from table 'Table' successfully!
-------------------------------------------------------------------------
Would you like to delete  from another table?
(Press any key to continue or [N/n] to cancel): n
```

#### Verifying the Record Deletion

Once the record is deleted, you can verify the change by selecting the table again:

```bash
----------------------------------------
Enter the Database Table Name to select from table: Table

---------------------------------------------
Please, select an option from the following: 
---------------------------------------------
1) Select all Table
2) Select specific column
3) Select specific record
4) Back
#? 1
-----------------------------------------------
displaying all records from the table 'Table'.
-----------------------------------------------
1:Karim:24
---------------------------------------------
```
As you can see, the record with ID '2' is no longer in the table.

---

#### Delete All Records

The user can also choose to delete all records from the table:

```bash
----------------------------------------
Enter the Database Table Name to delete: Table
---------------------------------------------------
Select an option to delete from the database table:
1) Delete All Records from Table
2) Delete Specific Record from Table
3) Back
#? 1
----------------------------------------------------
Are you sure you want to delete 'Table' table?
(Press any key to confirm or [N/n] to cancel): 
----------------------------------------------------------
All records in table 'Table' have been deleted successfully.
----------------------------------------------------------
Would you like to delete  from another table?
(Press any key to continue or [N/n] to cancel): n
```

#### Verifying Deletion of All Table Records

After deleting all records from the table, you can verify the change:

```bash
---------------------------------------------
Please, select an option from the following: 
---------------------------------------------
1) Create table
2) Insert tables
3) List table
4) Drop table
5) Select from table
6) Update from table
7) Delete from table
8) Back
#? 5
----------------------------------------
Enter the Database Table Name to select from table: Table
|------------------------------|
|The table 'Table' already empty.|
|------------------------------|
Would you like to select from another table?
(Press any key to continue or [N/n] to cancel): n
```
---

#### Example of Dropping a Table

Once the user selects "Drop table", the following process occurs:

```bash
---------------------------------------------
Please, select an option from the following: 
---------------------------------------------
1) Create table
2) Insert tables
3) List table
4) Drop table
5) Select from table
6) Update from table
7) Delete from table
8) Back
#? 4
-----------------------------------
Select an option to drop database tables:
1) Drop All DB Tables
2) Drop Specific DB Table
3) Back
#? 1
----------------------------------------------------
Are you sure you want to delete all database Tables?
(Press any key to confirm or [N/n] to cancel): n
-----------------------------------
Select an option to drop database tables:
1) Drop All DB Tables
2) Drop Specific DB Table
3) Back
#? 2
--------------------------------------
Enter the Database Table Name to drop: Table
----------------------------------------------------
Are you sure you want to delete 'Table' table?
(Press any key to confirm or [N/n] to cancel): 
---------------------------------------------------
Database table [Table] deleted successfully!
---------------------------------------------------

lets verify the dropping table
---------------------------------------------
Please, select an option from the following: 
---------------------------------------------
1) Create table
2) Insert tables
3) List table
4) Drop table
5) Select from table
6) Update from table
7) Delete from table
8) Back
#? 3
|-----------------------------------|
| No database tables found to list! |
|-----------------------------------|
Press any key to continue...
```
---



