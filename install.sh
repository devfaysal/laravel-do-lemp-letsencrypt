#!/bin/bash
clear

read -p "Please enter the git repo: " repo

git clone $repo

echo "Repository Cloned"

read -p "Please enter the site root folder name " rootFolder

mv ytsite $rootFolder

cd $rootFolder

composer install

cp .env.example .env

php artisan key:generate

sudo chmod -R 777 storage

touch storage/database/database.sqlite

sudo nano .env

php artisan migrate

php artisan db:seed

echo "All Done"