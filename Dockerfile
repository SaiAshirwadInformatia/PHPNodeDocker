# PHP-Node based image with Grunt-Bower-Composer components support
FROM php:7.1

MAINTAINER Rohan Sakhale <rs@saiashirwad.com>

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \	
	&& php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
	&& php composer-setup.php --install-dir=/usr/bin --filename=composer \
	&& php -r "unlink('composer-setup.php');"

RUN apt-get update \
	&& apt-get install nodejs -y \
	&& apt-get install npm -y \
	&& apt-get install nodejs-legacy -y \
	&& npm install -g grunt-cli \
	&& npm install -g bower \
	&& apt-get install git -y

CMD ["php", "composer", "node", "npm", "bower", "grunt", "git"]
