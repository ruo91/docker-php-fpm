#
# Dockerfile - PHP FPM
#
# - Build
# git clone https://github.com/ruo91/docker-php-fpm /opt/docker-php-fpm
# docker build --rm -t php-fpm /opt/docker-php-fpm
#
# - Run
# docker run -d --name="php-fpm" -h "php-fpm" -v /tmp:/tmp -v /home:/home php-fpm
#
# Base images
FROM     ubuntu:14.04
MAINTAINER Yongbok Kim <ruo91@yongbok.net>

# Change the repository
RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list

# The package to update and install
RUN apt-get update && apt-get install -y supervisor build-essential \
 php5-dev php5-fpm php5-mysql php5-redis php5-curl php5-gd php5-geoip php5-imagick php5-mcrypt php5-mhash php5-readline php5-recode php5-rrd \
 php5-sasl php5-snmp php5-sqlite php5-svn php5-tidy php5-xcache php5-xhprof php5-xmlrpc php5-xsl

# Socket
RUN sed -i 's/listen \= \/var\/run\/php5-fpm.sock/listen = \/tmp\/php5-fpm.sock/g' /etc/php5/fpm/pool.d/www.conf

# Supervisor
RUN mkdir -p /var/log/supervisor
ADD conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Port
EXPOSE 9000

# Daemon
CMD ["/usr/bin/supervisord"]