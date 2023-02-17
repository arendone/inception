# Tell the system where from to build the image, in which OS to build upon
FROM debian:buster

# Install nginx and update the system
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx && \
	apt-get install openssl && \
	rm -rf /var/lib/apt/lists/*

# Copy self-signed
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=DE/ST=Baden Wuerrtemberg/L=Heilbronn/O=42Heilbronn/OU=Student/CN=arendon.42.fr/emailAddress=arendon-@student.42heilbronn.de"

# Copy the conf file
COPY ./conf/nginx.conf /etc/nginx/conf.d
#The CMD command will run nginx, but since it runs in the background we need to 
#leave it running in the foreground with the "daemon off;" flag otherwise when the image is
#finished being built nginx will stop.
CMD ["nginx", "-g", "daemon off;"]
