#!/bin/bash
sudo hostnamectl set-hostname django-server
yes | sudo apt-get update
yes | sudo apt-get upgrade
sudo echo "$adrss django-server" >> /etc/hosts
sudo sed -i 's/127.0.0.1localhost/127.0.0.1localhost \n$adrss django-server/' /etc/hosts
sudo apt-get -y install ufw
sudo ufw default allow outgoing
sudo ufw default deny incoming 
sudo ufw allow ssh
sudo ufw allow 8000
yes | sudo ufw enable
sudo ufw status
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-venv
echo "--------------------"
pwd
cd ~/weatherDjango
pwd
python3 -m venv venv 
cd ~/weatherDjango/the_weather | source venv/bin/activate &
cd ./the_weather
sudo apt-get install mysql-server 
pip3 install -r requirements.txt
echo "--------------------"
echo "____________________"
cd ./the_weather
pwd
#sudo sed -i 's/DEBUG = True/DEBUG = False/' settings.py
echo "false ---> true done"
echo "____________________"
x=\"
adr=$x$1$x

echo $adr
echo $adrss
echo $1
sudo sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = [$adr]/"  settings.py
sudo touch /etc/config.json 
sudo chown ubuntu /etc/config.json
echo "config.json created"
sudo sed -n '23p' settings.py > /etc/config.json
sudo sed -i 's/.*=/ /' /etc/config.json
sudo sed -i "s/'/+/g" /etc/config.json
sudo sed -i 's/+/"/g' /etc/config.json
sudo sed -i 's/^/\t\"SECRET_KEY": /' /etc/config.json
sudo sed -i 's/^/\{\n /' /etc/config.json
sudo chown ubuntu /etc/config.json
sudo echo "}" >> /etc/config.json
sudo sed -i "s/import os/import os \nimport json \nwith open (\'\/etc\/config.json\') as config_file: \n\tconfig = json.load\(config_file\) /g" settings.py
sudo sed -i "s/SECRET_KEY =.*/SECRET_KEY = config\['SECRET_KEY'\] /" settings.py
pwd
cd ~/weatherDjango/the_weather/
echo "done"
#source venv/bin/activate | echo | 
$ python3 manage.py runserver 0.0.0.0:8000 &

