# PHP-Node based image with Grunt-Bower-Composer components support
FROM node:latest

MAINTAINER Rohan Sakhale <rs@saiashirwad.com>

RUN apt-get update && apt-get install -y apt-transport-https \
	&& apt-get install software-properties-common \
	&& apt-add-repository ppa:ondrej/php \
	&& apt-get update \
	&& apt-get install php7.1 -y \
	&& php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
	&& php composer-setup.php --install-dir=/usr/bin --filename=composer \
	&& php -r "unlink('composer-setup.php');"

RUN apt-get update \
	&& npm install -g grunt-cli \
	&& npm install -g bower \
	&& npm install -g yarn \
	&& npm install -g gulp \
	&& apt-get install git -y \
	&& apt-get install zip -y \
	&& apt-get install unzip -y

CMD ["php", "composer", "node", "npm", "bower", "grunt", "yarn", "gulp"]
