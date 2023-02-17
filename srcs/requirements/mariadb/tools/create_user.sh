# #!/bin/bash

# Start the MySQL service
service mysql start

echo "Creating database ${MYSQL_DATABASE} and user ${MYSQL_USER}"
mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
mysql -u root -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';"
mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"

mysql -u root -e "FLUSH PRIVILEGES;"

echo "Setting root password $MYSQL_ROOT_PASSWORD"
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -u root "-p${MYSQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# Stop the MySQL service
# service mysql stop
