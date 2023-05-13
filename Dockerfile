FROM mysql:latest

# # set environment variables
ENV MYSQL_ROOT_PASSWORD=password

# add the initialization script
COPY ./database_gymtracker.sql /docker-entrypoint-initdb.d/

# MySQL port
EXPOSE 3306

# Start the MySQL service
CMD ["mysqld"]
