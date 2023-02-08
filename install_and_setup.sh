#!/bin/bash

# Function to install PHP and Apache
install_php_and_apache() {
  echo "Installing PHP and Apache..."
  pkg install php apache2
}

# Function to start Apache service
start_apache() {
  echo "Starting Apache service..."
  apachectl
}

# Function to create a public directory for Apache
create_public_directory() {
  echo "Creating a public directory for Apache..."
  mkdir ~/www
}

# Function to create a sample PHP file
create_sample_php_file() {
  echo "Creating a sample PHP file..."
  echo "<?php phpinfo(); ?>" > ~/www/index.php
}

# Main function to run the script
main() {
  install_php_and_apache
  start_apache
  create_public_directory
  create_sample_php_file
  echo "Installation and setup complete!"
}

# Call the main function
main
