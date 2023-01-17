sudo yum update -y
sudo yum -y install java-11-openjdk java-11-openjdk-devel java-11-openjdk-headless
wget https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz
tar xvf openjdk-17.0.2_linux-x64_bin.tar.gz
sudo mv jdk-17.0.2/ /opt/jdk-17/
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm
sudo rpm -ivh jdk-17_linux-x64_bin.rpm
sudo rpm -ivh –prefix=// .rpmfile

edit .bashrc and add:
export JAVA_HOME=/opt/jdk-17
export PATH=$PATH:$JAVA_HOME/bin

source ~/.bashrc
edit /etc/profile and add export JAVA_HOME=/usr/java/default
source /etc/profile
echo $JAVA_HOME
sudo alternatives --config java    and select java 17
java -version
javac --version
which java

create Hello_World.java file and edit it :
	public class helloworld {
  	    public static void main(String[] args) {
    	        System.out.println("Hello Java World.");
  	    }
	}

java Hello_World.java
sudo yum -y install https://dist.neo4j.org/neo4j-java17-adapter.noarch.rpm

go to /etc/yum.repos.d and create neo4j.repo file and edir it :
  [neo4j]
	name=Neo4j RPM Repository
	baseurl=https://yum.neo4j.com/stable/5
	enabled=1
	gpgcheck=1

yum -y --nogpgcheck install neo4j-5.3.0   or  yum -y --nogpgcheck install neo4j-enterprise-5.3.0
sudo systemctl start neo4j
sudo systemctl enable neo4j
neo4j start
neo4j status

sudo systemctl stop neo4j
sudo systemctl start neo4j
sudo systemctl restart neo4j
sudo systemctl reload neo4j
sudo systemctl disable neo4j
sudo systemctl enable neo4j
sudo systemctl status neo4j

neo4j stop
neo4j start
neo4j restart
neo4j reload
neo4j disable
neo4j enable
neo4j status
