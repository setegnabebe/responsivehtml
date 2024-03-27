FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copy your application code (replace with your actual build steps)

COPY ./*.html ./*.css ./*.js ./*.jpg ./*.png ./*.gif ./images/*  /usr/share/nginx/html/

EXPOSE 3030

# Start Nginx web server
CMD [ "nginx", "-g", "daemon off;" ]
