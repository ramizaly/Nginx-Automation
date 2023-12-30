#!/bin/bash

set -e

if [ "$#" -ne 4 ]; then
    echo "Invalid Arguments, Usage: $0 <website_directory> <domain_name> <path_to_cert_file> <path_to_private_key>"
    exit 1
fi

website_dir=$1
domain_name=$2
cert_file=$3
key_file=$4

website_dir_name=$(basename "$website_dir")
web_root="/var/www/html/"


echo "---UPDATING REPOSITORIES---"
apt update

echo "---Installing Nginx---"
apt install -y nginx

if [ -d "$web_root" ]; then
    echo "---Moving The Website To the Web Root Directory---"
    mv "$website_dir" "$web_root"
else
    echo "---Web Root Directory Does not Exist , Creating it---"
    mkdir -p "$web_root"
    mv "$website_dir" "$web_root"
fi

echo "---Creating Virtual Configuration File---"
touch "/etc/nginx/sites-available/website.conf"

nginx_config=$(cat <<EOF
server {
    listen 80;
    listen [::]:80;

    server_name "$domain_name" www."$domain_name";

    location / {
        return 301 https://\$host\$request_uri;
    }

    location ^~ /.well-known/acme-challenge/ {
        default_type "text/plain";
        root "$web_root/$website_dir_name";
    }
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name "$domain_name" www."$domain_name";

    ssl_certificate "$cert_file";
    ssl_certificate_key "$key_file";

    location / {
        root "$web_root/$website_dir_name";
        index index.html;
    }
EOF
)

echo "$nginx_config" > "/etc/nginx/sites-available/website.conf"

echo "---Creating A symbolic Link---"
ln -s /etc/nginx/sites-available/website.conf /etc/nginx/sites-enabled/website.conf

echo "---Restarting Nginx---"
service nginx restart

echo "---Visit http://$domain_name/ to See your website---"





