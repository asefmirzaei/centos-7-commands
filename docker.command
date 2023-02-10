# ================================================================== install ==================================================================
# Uninstall old versions
sudo yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo docker --version

sudo docker login -u USERNAME -p PASSWORD
# or
sudo docker login -u asefmirzaei --password-stdin

sudo docker run hello-world

sudo systemctl stop docker
sudo systemctl start docker
sudo systemctl restart docker
sudo systemctl reload docker
sudo systemctl disable docker
sudo systemctl enable docker
sudo systemctl status docker
# ================================================================= uninstall =================================================================

# ================================================================= commands ==================================================================
# images commands :
sudo docker image # show list all images
sudo docker image ls # show list all images
sudo docker image ls -a # show list all images default hides intermediate images

sudo docker images -f "dangling=true" # show list all dangling image (whith none tag) .
  # reference : that can be used in order to isolate images having a certain name or tag.
  # before : to filter images created “before” a specific point in time.
  # since : to filter images since a specific point in time (usually another image creation).
  # label : if you used the LABEL instruction to create metadata for your image you can filter them later with this key.
  # dangling : in order to isolate images that are not used anymore.
  
# Listing only image ids :
sudo docker images --quiet
# or
docker images -q

# Listing and formatting images :
sudo docker images --format "YOR_FORMAT"
# example: sudo docker images --format "{{.Repository}} has the following {{.ID}}"
  # .ID :	The ID of your image
  # .Repository :	The image repository
  # .Tag :	The tag of your image
  # .Size :	The size of your image
  # .CreatedSince :	The time since your image was created
  # .CreatedAt :	The point in time when your image was created
  # .Digest :	The digest of your image (in short their UUIDs)
  
 
