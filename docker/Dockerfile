FROM ubuntu:14.04
RUN apt-get update && \
    apt-get install -y apache2  && \
    [ -d /var/run/apache2 ] || mkdir /var/run/apache2 && \
    [ -d /var/lock/apache2 ] || mkdir /var/lock/apache2
ADD index.html /var/www/html/
EXPOSE 80
env APACHE_RUN_USER    www-data
env APACHE_RUN_GROUP   www-data
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_RUN_DIR     /var/run/apache2
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_LOG_DIR     /var/log/apache2
env LANG               C
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
