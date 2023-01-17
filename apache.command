sudo yum update -y
sudo yum install-y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

sudo systemctl stop httpd
sudo systemctl start httpd
sudo systemctl restart httpd
sudo systemctl reload httpd
sudo systemctl disable httpd
sudo systemctl enable httpd
sudo systemctl status httpd
