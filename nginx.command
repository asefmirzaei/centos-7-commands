sudo yum update -y
sudo yum install epel-release -y
sudo yum info nginx
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo nginx -v
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo chown -R $USER:$USER /var/www/yoursitename
check your host ip in browser
config your nginx file in /etc/nginx

sudo systemctl stop nginx
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
sudo systemctl disable nginx
sudo systemctl enable nginx
sudo systemctl status nginx
