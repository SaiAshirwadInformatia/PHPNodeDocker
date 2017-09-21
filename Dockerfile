# PHP-Node based image with Grunt-Bower-Composer components support
FROM edbizarro/gitlab-ci-pipeline-php:7.1-alpine

MAINTAINER Rohan Sakhale <rs@saiashirwad.com>

RUN apt-get update \
	&& npm install -g grunt-cli \
	&& npm install -g bower \
	&& npm install -g gulp \
	&& apt-get install git -y \
	&& apt-get install zip -y \
	&& apt-get install unzip -y

CMD ["php", "composer", "node", "npm", "bower", "grunt", "yarn", "gulp"]
