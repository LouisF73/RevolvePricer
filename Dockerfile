FROM php:8.2-apache

# Put your app in place
COPY . /var/www/html/

# Render provides $PORT at runtime; make Apache listen on it.
RUN sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf \
 && sed -i 's/:80/:${PORT}/' /etc/apache2/sites-enabled/000-default.conf

# Start Apache with PORT set by Render
CMD ["bash", "-lc", "sed -i \"s/Listen 80/Listen ${PORT}/\" /etc/apache2/ports.conf && sed -i \"s/:80/:${PORT}/\" /etc/apache2/sites-enabled/000-default.conf && apache2-foreground"]

