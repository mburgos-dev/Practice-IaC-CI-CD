# Base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y nginx

# Copy application
COPY app/ /var/www/html/

# Expose port
EXPOSE 80

# Start command
CMD [ "nginx", "-g", "daemon off;" ]
