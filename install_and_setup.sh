#!/usr/bin/bash

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

# Function to install PHPMyAdmin
install_phpmyadmin() {
  echo "Installing PHPMyAdmin..."
  pkg install phpmyadmin
}

# Function to create symbolic link for PHPMyAdmin
create_symbolic_link() {
  echo "Creating symbolic link for PHPMyAdmin..."
  ln -s /data/data/com.termux/files/usr/share/phpmyadmin /data/data/com.termux/files/usr/share/apache2/default-site/htdocs/phpmyadmin
}

# Function to install MySQL
install_mysql() {
  echo "Installing MySQL..."
  pkg install mariadb
}

# Function to start MySQL service
start_mysql() {
  echo "Starting MySQL service..."
  mysql_install_db --user=root
  mysqld_safe &
}

# Function to set root password for MySQL
set_mysql_root_password() {
  echo "Setting root password for MySQL..."
  mysqladmin -u root password 'new-password'
}

# Main function to run the script
main() {
  install_php_and_apache
  start_apache
  install_phpmyadmin
  create_symbolic_link
  install_mysql
  start_mysql
  set_mysql_root_password
  echo "Installation and setup complete!"
}

# Call the main function
main
