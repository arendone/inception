FROM debian:buster

#Exposes the port only to the other containers in the same Docker network
EXPOSE 3306

RUN apt-get update && \
	apt-get install -y procps mariadb-server && \
	rm -rf /var/lib/apt/lists/*

#Custom MariaDB server configuration file
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN mysql_install_db

#Create database and user
COPY tools/create_user.sh /
RUN chmod +x /create_user.sh
# RUN bash ./create_user.sh
# RUN rm -rf ./create_user.sh
# RUN service mysql stop

#Default command that will be run when the container is started.
#In this case, to start the MariaDB server.
# CMD ["mysqld_safe"]
CMD bash -c "bash /create_user.sh && mysqld_safe"

# test if you can connect to maridb database with user anahi
# sudo docker exec -it mariadb mariadb --user anahi -proot
# SHOW DATABASES;
# USE wordpress;
# SHOW TABLES;