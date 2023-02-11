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

sudo docker run IMAGE_NAME # run an image as a container.
sudo docker run IMAGE_NAME:TAG_NAME # run an image with selected tag or version as a container.
sudo docker run -d IMAGE_NAME # run an image as a container in background.
sudo docker run --detach IMAGE_NAME # run an image as a container in background.
sudo docker run --name YOUR_NAME IMAGE_NAME # run an image as a container with selected name.
sudo docker run -p YOUR_PORT IMAGE_NAME # run an image as a container on .
sudo docker run --publish YOUR_PORT IMAGE_NAME # run an image as a container on .
sudo docker run -p YOUR_PORT:YOUR_CONTAINER_PORT IMAGE_NAME # run an image as a container and publish container on selected port in your host.
sudo docker run --publish YOUR_PORT:YOUR_CONTAINER_PORT IMAGE_NAME # run an image as a container and publish container on selected port in your host.

sudo docker ps # show all runing containers.
sudo docker ps -a # show all containers.
sudo docker ps --all # show all containers.
sudo docker ps -n NUMBER_OF_CONTAINERS # show n last created containers (includes all states)
sudo docker ps --last NUMBER_OF_CONTAINERS # show n last created containers (includes all states)
sudo docker ps -l # show the latest created container (includes all states)
sudo docker ps --latest # show the latest created container (includes all states)
sudo docker ps -q # Only display container IDs.
sudo docker ps --quiet # Only display container IDs
sudo docker ps -aq # show all containers just ids.
sudo docker ps -f "label=color" # show all containers .filter output based on conditions provided.
sudo docker ps --filter "label=color" # show all containers .filter output based on conditions provided.
    # id : Container’s ID
    # name : Container’s name
    # label : An arbitrary string representing either a key or a key-value pair. Expressed as <key> or <key>=<value>
    # exited : An integer representing the container’s exit code. Only useful with --all.
    # status : One of created, restarting, running, removing, paused, exited, or dead
    # ancestor : Filters containers which share a given image as an ancestor. Expressed as <image-name>[:<tag>], <image id>, or <image@digest>
    # before or since : Filters containers created before or after a given container ID or name
    # volume : Filters running containers which have mounted a given volume or bind mount.
    # network : Filters running containers connected to a given network.
    # publish or expose : Filters containers which publish or expose a given port. Expressed as <port>[/<proto>] or <startport-endport>/[<proto>]
    # health : Filters containers based on their healthcheck status. One of starting, healthy, unhealthy or none.
    # isolation : Windows daemon only. One of default, process, or hyperv.
    # is-task : Filters containers that are a “task” for a service. Boolean option (true or false)
sudo docker ps --format "{{.ID}}: {{.Command}}" # show all containers .Format output using a custom template.
    # .ID : Container ID
    # .Image : Image ID
    # .Command : Quoted command
    # .CreatedAt : Time when the container was created.
    # .RunningFor : Elapsed time since the container was started.
    # .Ports : Exposed ports.
    # .State : Container status (for example; “created”, “running”, “exited”).
    # .Status : Container status with details about duration and health-status.
    # .Size : Container disk size.
    # .Names : Container names.
    # .Labels : All labels assigned to the container.
    # .Label : Value of a specific label for this container. For example '{{.Label "com.docker.swarm.cpu"}}'
    # .Mounts : Names of the volumes mounted in this container.
    # .Networks : Names of the networks attached to this container.

sudo docker stop CONTAINER_NAME # stop a container with name.
sudo docker stop CONTAINER_NAME CONTAINER_NAME CONTAINER_NAME # stop containers with names.
sudo docker stop CONTAINER_ID CONTAINER_ID CONTAINER_ID # stop containers with container ids.
sudo docker stop $(sudo docker ps -q) # stop all containers with ids.
sudo docker stop -t TIME_TO_SECOND CONTAINER_ID # stop a container with id.seconds to wait before killing the container.
sudo docker stop --time TIME_TO_SECOND CONTAINER_ID # stop a container with id.seconds to wait before killing the container.
sudo docker stop -s=SIGTERM CONTAINER_ID # stop a container with id. signal to send to the container
sudo docker stop --signal=SIGTERM CONTAINER_ID #  stop a container with id. signal to send to the container
