# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Video
https://www.youtube.com/watch?v=DhxLOC-9kW0&list=PLR8BLHNyVZDVkZHDbm2mSL4RMISIBuBqs

# Commands
rails s - run app

## Create app

rails new instaclone 

## Creating our first scaffold

rails g scaffold posts title:string description:string keywords:string
rails db:migrate

config/routes.rb
"""
Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
"""

## Add bootstrap

app/views/layouts/application.html.erb
"""
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
"""

## Add footer & navbar
create app/views/layouts/_navbar.html.erb
"""
https://getbootstrap.com/docs/5.3/components/navbar/ - Navbar w/ text -
"""

app/views/layouts/application.html.erb
"""
 <%= render "layouts/navbar" %>
"""

edit app/views/layouts/_navbar.html.erb
"""
 <%= link_to "Navbar w/ text", posts_path, class:"navbar-brand" %>
 ...
 <li class="nav-item">
    <%= link_to "Home", root_path, class:"nav-link" %>
</li>
 """

 create app/views/layouts/_footer.html.erb
"""
https://mdbootstrap.com/docs/standard/navigation/footer/ - Basic example
"""

app/views/layouts/application.html.erb
"""
 <%= yield %>
 <%= render "layouts/footer" %>
"""

## Create links & validate post

...

## Adding image support to image model

rails active_storage:install
rails db:migrate
rails s

## Static page

rails g controller home about

## Authentication (devise)

https://rubygems.org/gems/devise/versions/4.9.2
- copy "gemfile" paste in Gemfile
bundle install
rails g devise:install
- copy "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }" to config/environments/development.rb
- copy into app/views/layouts/application.html.erb
"""
<body>
    <%= render "layouts/navbar" %>
    <%= yield %>
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
     <%= render "layouts/footer" %>
  </body>
"""

rails g devise:views
rails g devise user
rails db:migrate

## Style devise forms 

...

## Connect user authentication to post model

rails g migration AddUseridToPosts user_id:string
rails db:migrate

# My Posts page

...

## Comment model

rails g scaffold comment text:string user_id:string post_id:string
rails db:migrate

## Profile model

rails g controller users show
rails g migration AddDescriptionToUsers 

db/migrate/...add_description...
"""
class AddDescriptionToUsers < ActiveRecord::Migration[7.0]
  def change

    add_column :users, :bio, :string
    add_column :users, :username, :string
  end
end
"""
rails db:migrate

rails g devise:controllers users