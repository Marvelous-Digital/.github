#!/bin/bash

# Shared hosting infomaniak:
# By default, the lowest PHP version of any site is used when running commands.
# Use this to force a specific PHP version for the deployment script.
source ~/.profile

# --- Start Deployment ---
$PHP_PATH -v

$PHP_PATH artisan down || true

echo "Running Composer Install..."
composer install --no-interaction --prefer-dist

$PHP_PATH artisan artisan optimize:clear
$PHP_PATH artisan migrate --force
$PHP_PATH artisan storage:link
$PHP_PATH artisan config:clear
$PHP_PATH artisan cache:clear
$PHP_PATH artisan view:clear

$PHP_PATH artisan up
