#!/bin/bash

# in infomaniak, the following line will run with the default php.
# sourcing the profile will use the PHP version defined in the panel
source ~/.profile

# Put the application into maintenance
(php artisan down) || true

cd $1/ # TODO: update this value with your directory
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
