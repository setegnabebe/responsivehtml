FROM httpd:latest
COPY ./setegnabebe/responsivehtml /usr/local/apache2/htdocs/
# FROM docker.io/library/httpd:latest@sha256:374766f5bc5977c9b72fdb8ae3ed05b7fc89060e7edc88fcbf142d6988e58eeb                                       0.0s
# COPY ./guarder-1.0.0/ /usr/local/apache2/htdocs/ 

WORKDIR /usr/share/nginx/html

COPY ./*.html ./*.css ./*.js ./*.jpg ./*.png ./*.gif ./images/*  /usr/share/nginx/html/

EXPOSE 8083

# Start Nginx web server
CMD [ "nginx", "-g", "daemon off;" ]



