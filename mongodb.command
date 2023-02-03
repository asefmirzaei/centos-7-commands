# ================================================== install ==================================================
sudo yum update -y

# you can select version here
Create a /etc/yum.repos.d/mongodb-org-6.0.repo file
  [mongodb-org-6.0]
  name=MongoDB Repository
  baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/6.0/x86_64/
  gpgcheck=1
  enabled=1
  gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc

sudo yum install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
# ================================================== uninstall ================================================
sudo systemctl stop mongod
sudo yum erase -y $(rpm -qa | grep mongodb-org)
sudo yum erase -y mongodb-org*
sudo rm /tmp/mongodb-27017.sock
sudo rm /etc/systemd/system/mongodb.service
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongo
# ================================================== commands =================================================
sudo systemctl stop mongod
sudo systemctl start mongod
sudo systemctl restart mongod
sudo systemctl reload mongod
sudo systemctl disable mongod
sudo systemctl enable mongod
sudo systemctl status mongod
