FROM debian:buster

ARG MYSQL_DATABASE=${MYSQL_DATABASE}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

RUN apt-get update && apt-get install \
	mariadb-server -y && \
	rm -rf /var/lib/apt/lists/*

#Exposes the port only to the other docker containers in the same network
EXPOSE 3306

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY tools/create_user.sh /
RUN bash ./create_user.sh
RUN rm -rf create_user.sh

CMD ["mysqld_safe"]

# docker exec -it mariadb bash
# 1) mysql -u root -p -p4242 ->>>> SELECT User, Host FROM mysql.user;
# 2) mysql -u anahi -p -proot
# SHOW DATABASES;
# SHOW TABLES IN <database_name>; || USE wordpress; SHOW TABLES;