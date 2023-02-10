# Tell the system where from to build the image, in which OS to build upon
FROM debian:buster

# install nginx and update the system (debian is limited with its package manager so run apt-get
RUN apt-get update && apt-get install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

#Create the self signed SSL certificates
RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=arendon_.42.fr"

#The CMD command will run nginx, but since it runs in the background we need to 
#leave it running in the foreground with the "daemon off;" flag otherwise when the image is
#finished being built nginx will stop.
CMD ["nginx", "-g", "daemon off;"]
