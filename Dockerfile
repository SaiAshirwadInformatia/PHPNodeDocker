# PHP-Node based image with Grunt-Bower-Composer components support
FROM php:7.1

MAINTAINER Rohan Sakhale <rs@saiashirwad.com>

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \	
	&& php composer-setup.php --install-dir=/usr/bin --filename=composer \
	&& php -r "unlink('composer-setup.php');"

RUN apt-get update \
	&& apt-get install wget -y \
	&& wget -qO- https://deb.nodesource.com/setup_4.x | sudo bash - \
	&& apt-get install nodejs -y \
	&& apt-get install npm -y \
	&& apt-get install nodejs-legacy -y \
	&& npm install -g grunt-cli \
	&& npm install -g bower \
	&& apt-get install git -y \
	&& apt-get install zip -y \
	&& apt-get install unzip -y

CMD ["php", "composer", "node", "npm", "bower", "grunt"]
