if [ ! -d "/var/lib/mysql/wordpress_data" ]; then
echo "MariaDB: creating database ${DB_NAME} and user ${DB_USER}"
service mysql start
sleep 1
mysql -u root -e "CREATE DATABASE ${DB_NAME};"
mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
service mysql stop
sleep 1
else
echo "MariaDB: database ${DB_NAME} exist and user ${DB_USER} exist"
# fi
# mysqld_safe