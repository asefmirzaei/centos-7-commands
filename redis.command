sudo yum update -y
sudo yum -y install redis
sudo rpm -qi redis
sudo systemctl start redis
sudo systemctl enable redis
sudo systemctl status redis
redis-cli ping
sudo firewall-cmd --permanent --new-zone=redis
sudo firewall-cmd --permanent --zone=redis --add-port=6379/tcp
sudo firewall-cmd --permanent --zone=redis --add-source=client_server_private_IP
sudo firewall-cmd --reload
find bind 127.0.0.1 in /etc/redis.conf and add your ip at end of it.
find bind 127.0.0.1 in /etc/redis.conf and uncomment  requirepass  and set pass with it.
sudo systemctl restart redis

sudo systemctl stop redis
sudo systemctl start redis
sudo systemctl restart redis
sudo systemctl reload redis
sudo systemctl disable redis
sudo systemctl enable redis
sudo systemctl status redis
