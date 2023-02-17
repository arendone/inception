FROM debian:buster

#this exposes the port only to the other docker containers, but not to host
EXPOSE 3306

ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

RUN apt-get update && apt-get install \
	mariadb-server -y && \
	rm -rf /var/lib/apt/lists/*

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