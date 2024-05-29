#!/bin/sh

printenv >.env
chown nobody:nobody .env
chmod 400 .env

mkdir -p /var/www/html/storage/app/public/images

chown -R nobody:nobody /var/www/html/storage

cd /var/www/html

php artisan migrate --force
php artisan cache:clear
php artisan route:clear
php artisan route:cache
php artisan storage:link

/usr/bin/supervisord -c /etc/supervisord.conf
