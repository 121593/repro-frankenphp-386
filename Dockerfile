FROM dunglas/frankenphp as frank

RUN install-php-extensions \
zip

RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini; \
     sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/' $PHP_INI_DIR/php.ini;

####
# Here I make a modification to the phpfile
####
RUN sed -i "s/128/512/" /usr/local/etc/php/php.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY ./composer* /app/
RUN composer install --no-scripts

####
# Here I see that PHP ini has been interpred by PHP cli
####
RUN php -r "phpinfo();" | grep memory



COPY . /app
