sudo yum update -y
sudo yum install firewalld -y
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld
firewall-cmd --get-active-zones
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https

# open port
sudo firewall-cmd --permanent --add-port=3000/tcp
# or
sudo firewall-cmd --permanent --add-port=53/udp

sudo systemctl reload firewalld
sudo firewall-cmd --list-all
sudo reboot


sudo systemctl stop firewalld
sudo systemctl start firewalld
sudo systemctl restart firewalld
sudo systemctl reload firewalld
sudo systemctl disable firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld
