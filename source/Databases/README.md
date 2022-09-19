# database_tutorials
This project contains tutorials and exercises for the course on Computer Sciences of the Bsc in Engineering and 
Management at [EDEM](https://edem.es/). 
The course is organised in to the following folders: 
- **Tutorials:** Follow along tutorials for each of the classes. 
- **Class Exercises:** Exercises to do during class to better understand the content.
- **Extra Exercises:** Extra exercises you can do prepare for the exam
- **test databases:** Test databases used in the exercises

# User guide
The following guide will help you link the lectures in the unit with the contents of this project: 

- **Lecture 1:** Introduction to SQL
   - [Tutorial 1. Introduction to SQL](https://github.com/ffraile/database_tutorials/blob/main/tutorials/1.%20Introduction%20to%20SQL.ipynb)
   - [Data Creation Exercises](https://github.com/ffraile/database_tutorials/blob/main/class%20exercises/1.%20Introduction%20to%20SQL.ipynb)
- **Lecture 2:** Data modeling
  - (No supporting materials in class, check [Extra exercises](https://github.com/ffraile/database_tutorials/tree/main/Extra%20Exercises) to prepare for the exam.

- **Lecture 3**: Indexing and Join Clauses
  - [Tutorial 2. Indexing and Join Clauses](https://github.com/ffraile/database_tutorials/blob/main/tutorials/2.%20Indexing%20and%20Join%20clauses.ipynb)
  - [Indexing and Join Exercises](https://github.com/ffraile/database_tutorials/blob/main/class%20exercises/2.%20Indexing%20and%20Join%20Operations.ipynb)

- **Lecture 4**: Functions
  - [Tutorial 3. Sorting and grouping](https://github.com/ffraile/database_tutorials/blob/main/tutorials/3.%20Data%20Type%20Functions.ipynb)
  - [Functions exercises](https://github.com/ffraile/database_tutorials/blob/main/class%20exercises/3.%20Functions.ipynb)

- **Lecture 5**: Sorting and grouping
  - [Tutorial 4. Sorting and grouping](https://github.com/ffraile/database_tutorials/blob/main/tutorials/4.%20Sorting%20and%20grouping.ipynb)
  - [Sorting and Grouping Exercises](https://github.com/ffraile/database_tutorials/blob/main/class%20exercises/4.%20Sorting%20and%20grouping.ipynb)

- **Lecture 6**: Exam rehearsal
- (Data modeling exercises to prepare for the exam and Kahoot with type questions for the unit test)

# Practice Environment
## Docker Playground
The test environment in Docker Playground allows us to experiment with SQL using MySQL an [Docker](https://www.docker.com/). Docker is becoming 
the industry standard for containerisation: a Technology that allows to easily and efficiently deploy applications 
using *lightweight virtual machines* called containers. 
In this practice, you will deploy two services (or microservices) in Docker Playground:
- A [MySQL](https://www.mysql.com/) database service with the test databases in the test database folder. 
- A web administration interface, [adminer](https://www.adminer.org/).

You will then connect to the web interface of adminer to run your SQL queries. 
### Requirements 
For this environment you need an Internet connection and a **Docker hub account**. To create a Docker hub account, just 
go to [Docker Hub](https://hub.docker.com/), and sign up with a valid email address. 

### Steps
Click on the button below to start the test environment: 

[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/ffraile/database_tutorials/master/test_databases/stack.yml)

Docker Playground will ask for your Docker credentials to login. Once you enter your credentials, playground will be 
ready to start:

![docker node ready](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/docker_start_button.png)

When you click on start, Docker Playground will start building the services for the database and the adminer management 
frontend. The building process might take a while, so a bit of patience is needed at this stage:

![docker stack building](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/stack_builder.png)

**WARNING**: When the building is done, a click button will appear. The click button might be a little bit tricky to click, 
depending on your browser. If you can´t click it, you can just refresh the page and ignore the message. 
At this point you are able to access your docker environment in PWD. The easiest way to access it is to click 
on the **8080** link to the adminer frontend:

![docker node ready](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/docker_node_ready.png)

Once you click on the link, you will access the adminer frontend, where you need to enter the credentials to connect to
the MySQL service:
- user name: root
- password: mysql_is_awesome

![login to adminer](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/login_to_adminer.png)

Once you are in adminer, you can use its user interface to import the test database files and do the exercises. Just
copy the raw contents of the test database you want to load and enter it in the *SQL Command* input text field:

![create database](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/command_sql.png)

Now, you can select the database, and click on *SQL Command* to enter again your search query. 

![query](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/command_sql_2.png)

Enjoy!

## SQL Fiddle
[SQL Fiddle](http://sqlfiddle.com/) is a simple yet powerful environment you can use to set up a test environment for 
SQL really fast and test your code. 
### Requirements
No requirements

### Steps
In the web interface, in the panel to the left, you need to enter the ```CREATE TABLE```
and ```INSERT INTO``` statements to create your tables and insert your rows. 

![query](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/sql_fiddle.png)

To load a database into this panel, just copy the contents of the SQL file you want to test, paste the content of the 
file into the left panel and **delete** the `` CREATE DATABASE`` statements. For instance, for the car_retail test 
database, the page should look something like this:

![query](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/sql_fiddle_2.png)

Now, click on the **Build Schema** button. The right panel should be now enabled. In this panel you can now enter your 
search queries and start fiddling with SQL:

![query](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/sql_fiddle_3.png)

## Hosted MySQL and Workbench
In the long-term, the best alternative is to have MySQL installed in a PC. 

### Installer for Microsoft Windows
You can download the Installer for Microsoft Windows from this link: 

[MS Windows Installer](https://dev.mysql.com/downloads/installer/)

Select the lightweight installer (around 2.3Mb), and click Download. You do not need to create an Oracle account, click 
on "No thanks, just start my Download" instead. 

Open the installer, you will have to provide administration privileges to make changes in your computer. Select the 
Developer configuration option, that will install both MySQL service and MySQL Workbench in your computer. 

Follow the instructions, eventually you will be asked to select the encryption method. Select the "Use Legacy 
Encryption" method recommended for a test environment. 
You will also be asked to enter a password for the user root, enter a password for the service. 
When the installation is completed, you can launch the services control panel app to check whether your service is up
and running, just look for "Services" in your language in windows and look for the MySQL service and make sure it is 
started. You may shut it down when you are not using it. 

Now, you can look for and open Workbench in your system. You should have a connection to a local server: 

![MySQL workbench](https://raw.githubusercontent.com/ffraile/database_tutorials/master/img/mysql_workbench.png)

Enter the password you configured during the installation process and you are good to go!

### Installer for Mac OS X
Download the installer for MAC OS from this link: 

[MAC OS Installer](https://dev.mysql.com/doc/refman/8.0/en/macos-installation-pkg.html)

Follow the installation steps, just as in windows, eventually you will be asked to select the encryption method. Select the "Use Legacy 
Encryption" method recommended for a test environment. 
You will also be asked to enter a password for the user root, enter a password for the service.

Once the installation is completed, the service is available in your platform. Note that, if you chose to not start 
MySQL, you will need to enter launchctl from the command line or start MySQL by clicking "Start" using the MySQL 
preference pane to start it.

You should install MySQL Workbench as well, using the info in this link:

[Workbench](https://dev.mysql.com/doc/workbench/en/wb-installing-mac.html)

Once you installed it, as in Windows, create a connection to your local service, making sure it is started! Use the 
password you set during the installation process and you are ready to go!

