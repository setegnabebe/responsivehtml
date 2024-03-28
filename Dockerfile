FROM httpd:latest
COPY ./setegnabebe/responsivehtml /usr/local/apache2/htdocs/

WORKDIR /usr/share/nginx/html

COPY ./*.html ./*.css ./*.js ./*.jpg ./*.png ./*.gif ./images/*  /usr/share/nginx/html/

EXPOSE 8083

# Start Nginx web server
CMD [ "nginx", "-g", "daemon off;" ]



