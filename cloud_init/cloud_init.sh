#!/usr/bin/env bash
set -x
apt-get update -y
echo "installing git"
apt-get install -y git
/usr/bin/yum install -y git
echo "Installing pm2 globly"
/opt/bitnami/nodejs/bin/npm install pm2 -g
echo "clonning code"
mkdir /app
git clone https://github.com/Adiii717/nodejs-backend-hello-world.git /app
cd /app
echo "installing npm packages"
/opt/bitnami/nodejs/bin/npm install
EC2_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
export HOSTED_ON="Hosted on Ec2 having IP $EC2_IP"
export DEM_INFO="${DEM_INFO}"
echo "HOSTED_ON=$HOSTED_ON" >> /app/.env
echo "DEM_INFO=$DEM_INFO" >> /app/.env
chown -R bitnami:bitnami /app

sudo -u bitnami bash -c  'cd /app;/opt/bitnami/nodejs/bin/pm2 start bin/www --name demo'
sudo -u bitnami bash -c 'node -v;whoami'
whoami
echo "**************Cloud-init END********************"