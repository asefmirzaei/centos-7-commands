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
# if get error parsing HTTP 408 response body error :
sudo ifconfig | grep mtu
sudo ifconfig ens192 mtu 900 up
sudo systemctl restart network

# images commands :
sudo docker image pull IMAGE_NAME # download an images in the repository
sudo docker image pull IMAGE_NAME:IMAGE_TAG # download an images in the repository with selected tag or version
sudo docker image pull IMAGE_NAME -a # download all tagged images in the repository
sudo docker image pull IMAGE_NAME --all-tags # download all tagged images in the repository
sudo docker image pull IMAGE_NAME --disable-content-trust # download an image and skip image verification
sudo docker image pull IMAGE_NAME --platform # download an image and set platform if server is multi-platform capable
sudo docker image pull IMAGE_NAME --q # download an image and suppress verbose output
sudo docker image pull IMAGE_NAME --quiet # download an image and suppress verbose output

sudo docker image ls # show list all images
sudo docker image ls -a # show list all images default hides intermediate images
sudo docker image ls IMAGE_NAME# show list all images with its names.
sudo docker image ls IMAGE_NAME:TAG# show list all images with its names and tags.
sudo docker images ls -f "dangling=true" # show list all dangling image (whith none tag) .
    # reference : that can be used in order to isolate images having a certain name or tag.
    # before : to filter images created “before” a specific point in time.
    # since : to filter images since a specific point in time (usually another image creation).
    # label : if you used the LABEL instruction to create metadata for your image you can filter them later with this key.
    # dangling : in order to isolate images that are not used anymore.
sudo docker image ls -q # show list all images and only show image ids.
sudo docker image ls --quiet # show list all images and only show image ids.
sudo docker image ls --format "YOR_FORMAT" # Listing and formatting images.
# example: sudo docker images --format "{{.Repository}} has the following {{.ID}}"
    # .ID :	The ID of your image
    # .Repository :	The image repository
    # .Tag :	The tag of your image
    # .Size :	The size of your image
    # .CreatedSince :	The time since your image was created
    # .CreatedAt :	The point in time when your image was created
    # .Digest :	The digest of your image (in short their UUIDs)

sudo docker image history IMAGE_NAME # Show the history of an image.
sudo docker image history IMAGE_NAME -H # Show the history of an image and print sizes and dates in human readable format.
sudo docker image history IMAGE_NAME --human # Show the history of an image and print sizes and dates in human readable format.
sudo docker image history IMAGE_NAME -q # Show the history of an image and only show image IDs
sudo docker image history IMAGE_NAME --quiet # Show the history of an image and only show image IDs
sudo docker image history IMAGE_NAME --format # Show the history of an image and formatting images
# example: sudo docker image history node --format "{{.Repository}} has the following {{.ID}}"
    # .ID :	The ID of your image
    # .Repository :	The image repository
    # .Tag :	The tag of your image
    # .Size :	The size of your image
    # .CreatedSince :	The time since your image was created
    # .CreatedAt :	The point in time when your image was created
    # .Digest :	The digest of your image (in short their UUIDs)

sudo docker image inspect IMAGE_NAME # Display detailed information on one or more images.
sudo docker image inspect IMAGE_NAME -f # Display detailed information on one or more images and set output format.see format in https://docs.docker.com/config/formatting
sudo docker image inspect IMAGE_NAME --format # Display detailed information on one or more images and set output format.see format in https://docs.docker.com/config/formatting

sudo docker image rm IMAGE_NAMNE # delete a image
sudo docker image rm -f IMAGE_NAMNE # force delete a image
sudo docker image rm --force IMAGE_NAMNE # force delete a image
sudo docker rmi IMAGE_NAMNE # delete a image
sudo docker rmi -f IMAGE_NAMNE # force delete a image
sudo docker rmi --force IMAGE_NAMNE # force delete a image
sudo docker rmi --no-prune IMAGE_NAMNE # delete a image do not delete untagged parents
