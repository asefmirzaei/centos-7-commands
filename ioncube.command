install nginx or apache
uname -a
wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar -zxvf ioncube_loaders_lin_x86-64.tar.gz
cd ioncube/
ls -l
php -v
php -i | grep extension_dir
cp /root/ioncube/loader-wizard.php /var/www/sitename
cp /root/ioncube/ioncube_loader_lin_7.4.so /usr/lib64/php/modules
Go to /etc/php.ini
Add => zend_extension = /usr/lib64/php/modules/ioncube_loader_lin_7.4.so      at first after [php]
php -v
sudo systemctl restart php-fpm
sudo systemctl status php-fpm
go to https://yoursite.com/loader-wizard.php and complete steps
