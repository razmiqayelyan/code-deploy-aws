#!/bin/bash

echo "🚀 Starting Deployment Process..."

# Update system packages
sudo apt update -y

# Install Apache (or Nginx if needed)
if ! command -v apache2 &> /dev/null; then
    echo "Installing Apache..."
    sudo apt install apache2 -y
fi

# Ensure Apache is enabled & running
echo "Starting Apache server..."
sudo systemctl enable apache2
sudo systemctl start apache2

# Set correct permissions for web directory
echo "Setting permissions..."
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Copy deployed files to the web server root
echo "Deploying files..."
sudo cp -r /home/ubuntu/code-deploy-aws/* /var/www/html/

# Restart Apache to apply changes
echo "Restarting Apache..."
sudo systemctl restart apache2

echo "✅ Deployment Completed Successfully!"
