#!/bin/bash
echo "Starting application..."

# Ensure the script runs as a user with necessary permissions
sudo systemctl restart apache2 || sudo systemctl restart nginx

echo "Application successfully started!"
