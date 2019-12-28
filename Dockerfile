FROM ubuntu:18.04
MAINTAINER vinicius.torino@protonmail.com
LABEL Description="The Apache HTTP Server"
RUN  apt update &&  apt install -y  apache2 && apt clean
RUN mkdir /var/run/apache2
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_PID_FILE=/var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR=/var/run/apache2
ENV APACHE_LOCK_DIR=/var/lock/apache2
ENV APACHE_LOG_DIR=/var/log/apache2
VOLUME /var/www/html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2", "-D", "FOREGROUND"]
