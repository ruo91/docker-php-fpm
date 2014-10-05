Dockerfile - PHP FPM
=========================
#### Build
```
root@ruo91:~# git clone https://github.com/ruo91/docker-php-fpm /opt/docker-php-fpm
root@ruo91:~# docker build --rm -t php-fpm /opt/docker-php-fpm
```

#### Run
```
root@ruo91:~# docker run -d --name="php-fpm" -h "php-fpm" -v /tmp:/tmp -v /home:/home php-fpm
```
