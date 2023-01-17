sudo yum update -y
sudo yum install -y epel-release
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install yum-utils
sudo yum-config-manager --enable remi-php74
sudo yum update -y
sudo yum install -y php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json -y
php -v
php --modules
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
sudo systemctl status php-fpm

sudo systemctl stop php-fpm
sudo systemctl start php-fpm
sudo systemctl restart php-fpm
sudo systemctl reload php-fpm
sudo systemctl disable php-fpm
sudo systemctl enable php-fpm
sudo systemctl status php-fpm
