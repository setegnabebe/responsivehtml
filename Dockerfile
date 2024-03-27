FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copy your application code (replace with your actual build steps)
COPY . .

EXPOSE 3000

# Start Nginx web server
CMD [ "nginx", "-g", "daemon off;" ]
