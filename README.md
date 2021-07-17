[![Ruby](https://github.com/Samuel1698/PinkWug.live/actions/workflows/ruby.yml/badge.svg?branch=main)](https://github.com/Samuel1698/PinkWug.live/actions/workflows/ruby.yml)
# Comic & Store web application for PinkWug

## A work in progress
I started working on this project with the permission of PinkWug to practice what I learned in the Noble Desktop Full Stack Web Development Bootcamp.
This web app is currently in deployment, subject to many changes as I work closely with the creator of the comics this page showcases.

[Come take a look!](https://secret-retreat-55021.herokuapp.com/)


## Dependencies:
* [Imagemagick VIPS](https://github.com/janko/image_processing)

## To run this application you need
* Ruby 3.0.0
* Rails 6.0.3.7

* ### PostgresQL database named 'pinkwug'
  * CREATE ROLE pinkwug WITH LOGIN PASSWORD \'\<any password\>\';
  * ALTER ROLE pinkwug CREATEDB;
  * Type \du to see your new user
  * Quit the postgres console with \q
  * In terminal type psql postgres -U pinkwug
  * Back in the postgres prompt
  * CREATE DATABASE pinkwug;
  * CREATE DATABASE pinkwug_test;
* ### Webpacker
  * bundle install
  * yarn upgrade
  * bundle exec rails webpacker:install (Make sure the parent folder doesnt have a space, this causes webpacker error)
* rails db:reset

