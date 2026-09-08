#!/bin/bash
set -e

apt-get update
apt-get install -y nginx

cat <<HTML > /var/www/html/index.html
<!doctype html>
<html>
  <head><title>${instance_name}</title></head>
  <body><h1>${instance_name}</h1></body>
</html>
HTML

systemctl restart nginx
