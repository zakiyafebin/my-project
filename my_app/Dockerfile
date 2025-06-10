# Use an official Nginx image as the base
FROM nginx:alpine

RUN echo "--- Listing contents of build context before COPY ---"
RUN ls -l 

# Copy your web application files into the Nginx default HTML directory
# The '.' refers to the current directory where the Dockerfile is located (your my-webapp folder)
# /usr/share/nginx/html is the default directory Nginx serves files from
COPY my_app/index.html  /usr/share/nginx/html



COPY my_app/resources /usr/share/nginx/html/resources



# Expose port 80, which is the default port Nginx listens on
EXPOSE 80

# Command to run Nginx when the container starts (Nginx's default behavior)
 CMD ["nginx", "-g", "daemon off;"]