# README

# gop_app_server_api

This server has been built to support as a database server API for website "https://project5-gop-app-frontend.herokuapp.com/"
Below are technologies used to build this server

* Ruby version: ruby 2.3.3p222

* System dependencies:

    - JWT authentication: jwt, dotenv-rails
    - Rails version: 5.03
    - postgresql as the database for Active Recordpg: psql (PostgreSQL) 9.6.2
    - Puma: as the app server 3.0
    - bcrypt: use as ActiveModel has_secure_password (version 3.1.7)
    - CORS: handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
    - tzinfo-data platforms: [:mingw, :mswin, :x64_mingw, :jruby]

* Configuration: deployed on heroku  at 'https://gop-app-server-api.herokuapp.com/'

* Database creation: $heroku run rails db:migrate

* Database initialization: $heroku run rails db:seed

#=========== Schema =======================
user schema {
  - username: string
  - name: string
  - password. string
  - projects: []. // set of project id
}

project schema{
  - project_name: string
  - name: string
  - map:  img
  - description: string
  - comment:string  (if edit, should leave comment
  - ersi webservice id: integer // many
  - user_is: integer
  - Category: string
}

Esri webservices schema  {
  - title: string
  - url: string. // webservice
  - description: string
  - type: string.  // data-type
  - source: string // original public by "…"
  - project id: integer // many
}

#All users can see this project
shared project schema{
  - username: string
  - name: string
  - project_name: string
  - projects_id: integer  // project id
  - user_id; integer
}

* How to run the test suite: on web-browser runs "https://gop-app-server-api.herokuapp.com/"

* Deployment instructions:
    $ heroku login
    $ cd my-project
    $ git init
    $ heroku git:remote -a gop-app-server-api
    $ git add .
    $ git commit -am "make it better"
    $ git push heroku master
* ...
