FROM httpd:2.2

RUN mkdir -p /usr/local/apache2/run /usr/local/apache2/logs/website

COPY preview_config/conf /usr/local/apache2/conf
COPY preview_config/conf.d /usr/local/apache2/conf.d
COPY preview_config/mime.types /etc/mime.types

COPY saks-website.tar.gz /home/docroot/website/saks-website.tar.gz

WORKDIR /home/docroot/website

RUN tar xfz saks-website.tar.gz ./static
RUN rm /home/docroot/website/saks-website.tar.gz

EXPOSE 80
CMD ["httpd-foreground"]
