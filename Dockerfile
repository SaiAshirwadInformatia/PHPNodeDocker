# PHP-Node based image with Grunt-Bower-Composer components support
FROM ubuntu:trusty
MAINTAINER Rohan Sakhale <rs@saiashirwad.com>

RUN apt-get update \
	&& apt-get install php -y \	
	&& php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \	
	&& php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
	&& php composer-setup.php --install-dir=/usr/bin --filename=composer \
	&& php -r "unlink('composer-setup.php');"
  
RUN apt-get update \
  && apt-get install nodejs npm
  && npm install -g grunt-cli
  && npm install -g bower

CMD ["php", "composer", "node", "npm", "bower", "grunt"]
