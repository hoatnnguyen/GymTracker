# GymTracker

## Description

GymTracker is a Web app designed to help users achieve their fitness goals by providing them with a comprehensive way to track their progress. The app includes different features such as user profiles, activity logs, fitness goals, nutritional information.

## Installation Instructions

1. Install [MySQLWorkbench](https://www.mysql.com/products/workbench/)
2. Install [Docker](https://docs.docker.com/get-docker/)
3. Clone the [GitHub Repo](https://github.com/hoatnnguyen/GymTracker.git)

   ```
   % git clone https://github.com/hoatnnguyen/GymTracker.git
   ```

4. Open Docker App
5. Open Terminal, navigate to the folder where the Dockerfile and database_gymtracker fie locates. Run the following command to create the Docker image
   ```
   % docker build -t gymtracker_mysql .
   ```
6. Run the container
   ```
   % docker run -d -p 6603:3306 --name gymtracker_mysql_container gymtracker_mysql
   ```
7. Verify from MySQL Workbench. In MySQL Workbench, create a connection to `172.17.0.1` with user `root` and password `password`. You will see the database gymtracker.
