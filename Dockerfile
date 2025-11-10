# Base image
FROM nginx:alpine
# Copy application
COPY app/ /var/www/html/
# Expose port
EXPOSE 80

