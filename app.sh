#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove --purge
sudo apt autoclean
sudo apt install nginx unzip awscli php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-fpm php-mysql -y
sudo wget https://github.com/aarshsqaureops/wordpress/archive/refs/heads/master.zip
sudo unzip master.zip
cd wordpress-master/
sudo cp -r * /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
cd /etc/nginx/sites-enabled/
sudo wget https://wordpress.org/latest.zip
sudo unzip main.zip
sudo mv nginx-configuration-main/wordpress /etc/nginx/sites-enabled/
sudo systemctl reload php7.4-fpm.service
sudo rm -rf default main.zip nginx-configuration-main/
sudo systemctl reload nginx
cd ~
sudo wget https://s3.us-east-2.amazonaws.com/amazoncloudwatch-agent-us-east-2/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
#sudo aws configure --profile AmazonCloudWatchAgent
#sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:configuration-file-path
