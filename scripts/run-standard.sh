#!/bin/bash

# Put the application into maintenance
(php artisan down) || true

cd $1/
composer install

# clear cache and config
php artisan artisan optimize:clear

# Create a cache
php artisan route:cache
php artisan config:cache
php artisan view:cache

# link storage
php artisan storage:link

# generate sitemap
# php artisan sitemap:generate

# migrate db if needed
php artisan migrate --force

# Bring the application out of maintenance mode
php artisan up
