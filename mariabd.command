sudo yum update -y
Add /etc/yum.repos.d/MariaDB.repo file

# you can select version here
Add below to MariaBD.repo file :
  [mariadb]
  name = MariaDB
  baseurl = http://yum.mariadb.org/10.10/centos7-amd64
  gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
  gpgcheck=1

sudo yum -y install MariaDB-server MariaDB-client MariaDB-backup
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo systemctl status mariadb

mariadb-secure-installation
Switch to unix_socket authentication [Y/n] y
Change the root password? [Y/n] y
Remove anonymous users? [Y/n] y
Disallow root login remotely? [Y/n] y
Remove test database and access to it? [Y/n] y
Reload privilege tables now? [Y/n] y
mysql -V
mysqld --print-defaults
mysql -u root -p

sudo systemctl stop mariadb
sudo systemctl start mariadb
sudo systemctl restart mariadb
sudo systemctl reload mariadb
sudo systemctl disable mariadb
sudo systemctl enable mariadb
sudo systemctl status mariadb
