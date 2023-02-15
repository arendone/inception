# Tell the system where from to build the image, in which OS to build upon
FROM debian:buster

# Install nginx and update the system
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx && \
	apt-get install openssl

# Copy the conf file
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Copy self-signed
COPY ./tools/* /etc/nginx/ssl/

#The CMD command will run nginx, but since it runs in the background we need to 
#leave it running in the foreground with the "daemon off;" flag otherwise when the image is
#finished being built nginx will stop.
CMD ["nginx", "-g", "daemon off;"]
