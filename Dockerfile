FROM php:8.2-apache

# Tell Apache to listen on Render's port
ENV PORT=10000
RUN sed -i "s/80/${PORT}/g" /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf

COPY . /var/www/html/

EXPOSE 10000
