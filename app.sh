#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install nginx unzip mysql-server php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-fpm php-mysql -y
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
sudo cp -r wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo wget https://github.com/aarshsqaureops/nginx-configuration/archive/refs/heads/main.zip
sudo unzip main.zip
sudo cp -r nginx-configuration-main/* /etc/nginx/sites-enabled/
sudo rm -rf latest.zip wordpress/ main.zip nginx-configuration-main/ /etc/nginx/sites-enabled/default
sudo systemctl reload php8.1-fpm.service nginx.service
sudo wget https://s3.us-east-2.amazonaws.com/amazoncloudwatch-agent-us-east-2/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
#sudo aws configure --profile AmazonCloudWatchAgent
#sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:configuration-file-path
