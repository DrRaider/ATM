# Advanced database project - EFREI - ATM Simulator

# 1. Download the project from Github
Thanks to:
* the download zip button
* the git command (into the project folder): git clone https://github.com/DrRaider/ATM.git 

# 2. Open Eclipse IDE

# 3. Create a new Dynamic Web Project (File -> New - Dynamic Web project)
* Select a project name
* Select a target runtime (Apache Tomcat v8.5)
* Dynamic web module version: 3.1
* Let all the configurations as default
* Finish

# 4. Import files (downloaded from Github)
* Drag and drop files from the downloaded folder to the Project Explorer into Eclipse
* Select: Copy files and folders
* Overwrite All

Eclipse setup of our project is done.

# 5. Download MySQL WorkBench
* Go to: https://www.mysql.com/fr/downloads/
* Download the MySQL Community Edition (GPL)
* Follow step by step the default installation

# 6. Open MySQL WorkBench

# 7. Import the model
* Click on File -> Open model
* Open database.mwb

# 8. Setup the database connection
* Click on Database -> Forward Engineer
* Follow the default configuration: Next -> Next -> Next -> Close

# 9. Launch the database
* Click on Database -> Connect to Database -> OK
* If it's all right, you can try to execute this query: select * from users; to see if there are data.
* If it's not the case, you can execute the content of database.sql to fill in the database.

Now, the database is active, we are able use it.

# 10. Return on Eclipse to launch the project
* Right click on the project -> Run as -> Run on Server
* Wait a few seconds for the server launching
* A page into your web browser should appear (A url like that: http://localhost:8080/ATM/ or http://localhost:PORT/PROJECT NAME/)

# 11. Credentials to connect are:
* Login : 123
* Pwd : 123

Credentials are encrypted in our database.