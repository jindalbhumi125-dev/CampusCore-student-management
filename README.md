\# CampusCore – Student Registration \& Management System



CampusCore is a Java-based web application developed for registering and managing student records through a simple and user-friendly web interface.



The system provides database-backed student management functionality using Java Servlets, JSP, JDBC and MySQL. It allows users to register students, view records, search for students, update student information and delete student records.



\## Features



\- Student Registration

\- Duplicate Student ID Validation

\- View All Students

\- Search Students

\- Edit Student Details

\- Delete Student Records

\- MySQL Database Integration

\- JSP-based Web Interface

\- Java Servlet Backend

\- JDBC Database Connectivity

\- CRUD Operations



\## Technologies Used



\- Java

\- JSP

\- Jakarta Servlets

\- JDBC

\- MySQL

\- Apache Tomcat

\- Maven

\- HTML

\- CSS



\## CRUD Operations



| Operation | Feature |

|-----------|---------|

| Create | Register Student |

| Read | View and Search Students |

| Update | Edit Student Details |

| Delete | Delete Student Records |



\## Project Structure



```text

CampusCore-Student-Management

│

├── src

│   └── main

│       ├── java

│       │   ├── model

│       │   │   └── Student.java

│       │   │

│       │   ├── servlet

│       │   │   ├── RegisterStudentServlet.java

│       │   │   ├── ShowStudentsServlet.java

│       │   │   ├── EditStudentServlet.java

│       │   │   ├── DeleteStudentServlet.java

│       │   │   └── SearchStudentServlet.java

│       │   │

│       │   └── util

│       │       └── DBConnection.java

│       │

│       └── webapp

│           ├── index.jsp

│           ├── students.jsp

│           ├── edit.jsp

│           ├── search.jsp

│           └── WEB-INF

│

├── database

│   └── student\_db.sql

│

├── pom.xml

├── README.md

└── .gitignore

Database



The application uses MySQL to store and manage student records.



The database setup script is provided in:



database/student\_db.sql



The database contains student information required by the application.



Database Configuration



The database connection is handled through:



src/main/java/util/DBConnection.java



The application uses JDBC to establish a connection between the Java application and MySQL.



Example configuration:



private static final String USER = "root";

private static final String PASSWORD = "YOUR\_MYSQL\_PASSWORD";



Replace YOUR\_MYSQL\_PASSWORD with your own local MySQL password.



Do not publish your actual MySQL password on GitHub.



Application Workflow

User

&#x20; ↓

JSP / HTML Interface

&#x20; ↓

Java Servlet

&#x20; ↓

JDBC

&#x20; ↓

MySQL Database



Main Modules



1\. Student Registration



The registration module allows users to enter student details and store them in the MySQL database.



2\. Duplicate Student Validation



Before registering a student, the application checks whether the Student ID already exists in the database.



If the Student ID is already registered, the system displays a message informing the user that the student is already registered.



3\. View Students



The application displays registered student records retrieved from the MySQL database.



4\. Search Student



The search functionality allows users to find student records using the available student information.



5\. Edit Student



The edit functionality allows existing student information to be updated.



The Student ID is kept unchanged while the remaining student information can be modified.



6\. Delete Student



The delete functionality allows an existing student record to be removed from the database.



Advantages

Simple and user-friendly interface

Prevents duplicate student registration

Provides complete CRUD functionality

Uses MySQL for persistent data storage

Reduces manual student record management

Provides easy searching and updating of records

Can be extended with additional student management features

How to Run

Install Java JDK.

Install MySQL Server.

Install Apache Tomcat.

Install NetBeans or another compatible Java IDE.

Open the Maven project in the IDE.

Create the required MySQL database.

Execute the SQL script available in the database folder.

Configure the MySQL username and password in DBConnection.java.

Build the Maven project.

Run the application using Apache Tomcat.

Open the application in a web browser.

Example Database Setup



The database can be created using:



CREATE DATABASE student\_db;



Then select the database:



USE student\_db;



The required table structure can be created using the SQL script provided in the project.



Project Objectives

To develop a web-based student registration and management system.

To store student information using a MySQL database.

To implement CRUD operations using Java and JDBC.

To prevent duplicate student registration.

To provide facilities for searching, updating and deleting student records.

Learning Outcomes



After completing this project, the following concepts are demonstrated:



Understanding of Java web application development.

Understanding of JSP and Java Servlets.

Understanding of JDBC database connectivity.

Implementation of CRUD operations.

Understanding of MySQL database integration.

Development of a basic database-driven web application.

Future Enhancements

User authentication and login

Admin dashboard

Student attendance management

Marks and result management

Student profile management

Export student records

Cloud deployment

Role-based access control

Project Type



Academic Web Application / Mini Project



Author



Bhumi Jindal



\## Screenshots



\### Student Registration



!\[Student Registration](images/Registration.png)



\### Duplicate Student Validation



!\[Duplicate Student Validation](images/DuplicatedStudent.png)



\### Student Records



!\[Student Records](images/Studentlist.png)



\### Search Student



!\[Search Student](images/search.png)



\### Edit Student



!\[Edit Student](images/Edit.png)



\### Delete Student



!\[Delete Student](images/Delete.png)



\### Database



!\[Database](images/Database.png)





