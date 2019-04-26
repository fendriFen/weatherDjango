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
git clone https://github.com/fendriFen/weatherDjango.git
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-venv
cd weatherDjango
ls
python3 -m venv venv && source venv/bin/activate
cd ./the_weather
sudo apt-get install mysql-server 
pip3 install -r requirements.txt
sed -i 's/DEBUG = True/DEBUG = False/' weatherDjango/the_weather/the_weather/settings.py
sed -i 's/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \[$adrss\]/' weatherDjango/the_weather/the_weather/settings.py
sudo touch /etc/config.json 
sudo chown ubuntu /etc/config.json
sed -n '23p' weatherDjango/the_weather/the_weather/settings.py > /etc/config.json
sudo sed -i 's/.*=/ /' /etc/config.json
sudo sed -i "s/\'/+/g" /etc/config.json
sudo sed -i "s/+/\"/g" /etc/config.json
sudo sed -i 's/^/\t\"SECRET_KEY: /' /etc/config.json
sudo sed -i 's/^/\{\n /' /etc/config.json
sudo chown ubuntu /etc/config.json && echo "}" >> /etc/config.json
sed -i "s/import os/import os \nimport json \nwith open (\'\/etc\/config.json\') as config_file: \n\tconfig = json.load\(config_file\) /g" weatherDjango/the_weather/the_weather/settings.py
sed -i 's/=.*/ = config\['SECRET_KEY'\] /' weatherDjango/the_weather/the_weather/settings.py
cd weatherDjango/the_weather/
python3 manage.py runserver 0.0.0.0:8000 &



