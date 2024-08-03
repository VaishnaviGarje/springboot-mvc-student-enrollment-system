# Student-Subject Enrollment System

## Description
This is a Spring Boot MVC project for student-subject enrollment. It includes functionalities for user login, student enrollment, and subject management.

## Prerequisites
- Java 8 or higher
- Maven 
- MySQL 

## Setup Instructions

# 1. Clone the Repository
First, clone the repository to your local machine:
```sh
git clone https://github.com/VaishnaviGarje/springboot-mvc-student-enrollment-system.git
cd springboot-mvc-student-enrollment-system
#2. Configure the MySQL Database.
-Before configuration please Download MySQL server.
-Update the application.properties file with MySQL credentials.
spring.datasource.url=jdbc:mysql://localhost:3306/Enrollmentsystem?createDatabaseIfNotExist=true
spring.datasource.username=your_username(for e.g root)
spring.datasource.password=your_Password(for e.g root)
spring.datasource.driver-class-name=com.mysql.jdbc.Driver
spring.jpa.hibernate.ddl-auto=update
spring.jackson.serialization.fail-on-empty-beans=false
spring.application.name=demo.inrollment.system
spring.mvc.view.prefix=/view/
spring.mvc.view.suffix=.jsp
#3. Build and Run the Application.
Use Maven to build and run the application:
mvn spring-boot:run
#4. Access the Application
Open a web browser and go to "http://localhost:8080/home"     to access the application.

Application Endpoints
/home - Home page
/userlogin - User login page
/login - User login POST endpoint
/enroll - Student enrollment POST endpoint
/adminlogin - Admin login page
/viewstudents - View students page
/Saveuser - Save student POST endpoint
/viewsubjects - View subjects page
//manualy you need to add this password and username in database because i have not created registration form.
//to login use 
password  username
1                  invalid.user 
2                  student.user
3                  admin.user
JSP Files
The JSP files are located in src/main/webapp/view/

adminlogin.jsp
dashboard.jsp
home.jsp
login.jsp
viewstudents.jsp
viewsubjects.jsp

#5 .Required dependencies
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>3.3.2</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>
	<groupId>com.example</groupId>
	<artifactId>demo.inrollment.system</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>demo.inrollment.system</name>
	<description>spring boot project for student-subject-enrollment</description>
	<url/>
	<licenses>
		<license/>
	</licenses>
	<developers>
		<developer/>
	</developers>
	<scm>
		<connection/>
		<developerConnection/>
		<tag/>
		<url/>
	</scm>
	<properties>
		<java.version>1.8</java.version>
	</properties>
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-devtools</artifactId>
			<scope>runtime</scope>
			<optional>true</optional>
		</dependency>
		<dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
         <version>5.1.6</version>
        </dependency>
          <dependency>
            <groupId>org.apache.tomcat.embed</groupId>
            <artifactId>tomcat-embed-jasper</artifactId>
        </dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
	</dependencies>

	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>

</project>
-If you encounter any issues, ensure the following:

->MySQL is running, and the database is correctly set up.
->The application.properties file has the correct database credentials.
->Maven dependencies are correctly downloaded and installed.

...............................problems i faced...................................
1)mam/sir i have maintained relationship between this two classes in Entity's. But when i am enrolling didn't fetch the subjects that are enrolled by students. means student id and subject id. are not getting added in student_subject table.

