sudo yum update -y
rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-7.noarch.rpm
sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo
sudo yum --enablerepo=mysql80-community install mysql-community-server -y
sudo systemctl start mysqld
sudo systemctl enable mysqld
sudo systemctl status mysqld

grep "A temporary password" /var/log/mysqld.log
mysql_secure_installation
sudo systemctl restart mysqld
mysql -u root -p

sudo systemctl stop mysqld
sudo systemctl start mysqld
sudo systemctl restart mysqld
sudo systemctl reload mysqld
sudo systemctl disable mysqld
sudo systemctl enable mysqld
sudo systemctl status mysqld
