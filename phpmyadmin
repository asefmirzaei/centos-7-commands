sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y phpmyadmin
sudo chgrp -R nginx /etc/phpMyAdmin
sudo ln -s /usr/share/phpMyAdmin /usr/share/nginx/html
sudo systemctl restart php-fpm

# start with nginx
Set this nginx configoration in /etc/nginx/conf.d/phpmyadmin.sitename.com.conf
sudo nginx -t
sudo systemctl restart nginx
