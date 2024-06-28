#!/bin/bash

sudo apt update

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}

sudo apt install -y nginx certbot python3-certbot-nginx
sudo apt install -y certbot python3-certbot-nginx

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

source ~/.bashrc

nvm install --lts
nvm install 14
nvm use 14
sudo systemctl enable nginx

sudo systemctl start nginx

sudo cat > /etc/nginx/conf.d/api.conf <<EOF
server {
    
     listen 80;
     server_name api.wireapps.com;

     location / {
        proxy_pass http://127.0.0.1:5000/;
        proxy_redirect off;
        proxy_read_timeout 360s;
    }
}
EOF

sudo cat > /etc/nginx/conf.d/web.conf <<EOF
server {
     listen 80;
     server_name web.wireapps.com;

     location / {
        proxy_pass http://127.0.0.1:8080/;
        proxy_redirect off;
        proxy_read_timeout 360s;
    }
}
EOF

certbot run -n --nginx --agree-tos -d web.wireapps.com,api.wireapps.com  -m  mudara@mail.com  --redirect

sudo systemctl reload nginx
