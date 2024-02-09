#!/usr/bin/env bash

# Cd into code directory

cd /var/www/sazao_devops

# enter maintenance mode
php artisan down

# get the the latest code
git pull

## install composer dependencies
composer install --no-dev

## migrate the database
php artiasan migrate --force

## cache the app's config for speed boosting
php artisan config:cache

# run the other necessary commands
# like
# php artisan queue:work

# compile javascript assets
npm run build

# exit the maintenance mode
php artisan up
