apt-get update

apt-get install -y gnupg gnupg2 gnupg1

wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.keyservice
apt-key add mosquitto-repo.gpg.key
cd /etc/apt/sources.list.d/
wget http://repo.mosquitto.org/debian/mosquitto-jessie.list
apt-get update
apt-get -y dist-upgrade
apt-get update  
apt-get install -y mosquitto mosquitto-clients 
mkdir -p /mqtt/config /mqtt/data /mqtt/log


mosquitto -c /datavol/mqtt/config/mosquitto.conf