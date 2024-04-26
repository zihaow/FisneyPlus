# README

## Fisney Plus Introduction
This is an API that returns movies/TV shows from the database. Exisiting Users can add movie/TV show to their favorite lists. Users are also able to search shows with some query params (year, name, genres, start_year, end_year, or by year). 

## Gemfile walkthrough

Basic Authentication
```
devise
jwt
```

Content Management System (CMS)
```
rails_admin
sprockets
sass-rails
sassc-rails
```

Rails best practices
```
bullet
rails_best_practices
```

Testing
```
factory_bot
faker
pry-stack_explorer
rspec-rails
shoulda-matchers
```

Debugging
```
pry
pry-rails
pry-rescue
```

JSON Response
```
active_model_serializers
```

ENV variables
```
dotenv-rails
```

Other gems required to get to basic Rails App running
```
rails ~> 7.0
pg
puma
rack-cors
spring
listen

```

## Run the app

Run bundle install from the root repository of the project

    $ bundle install

Execute the following to create the databases:

    $ rails db:setup

Execute the following to initialize the database migrations:

    $ rails db:migrate

Execute the following to seed the database with some intial data:

    $ rails db:seed

Run the following command to start the app:

    $ rails s

From this point forward, you can use postman to simulate bookings. For what params to send, check the below section of `API Endpoints`

If you want to start again from scatch, run the following command to reset the database and re-ran the migrations.

    $ rails db:reset

To run rails best practices test suite

    $ rails_best_practices .

To run rspec test suites
    $ bundle exec rspec

To enter rails console to see the activerecord objects:
    $ rails c

## API Endpoints
Exisiting User login
`POST http://localhost:3000/login`
Payload
```
{
    "email": "test.man@test.com",
    "password": "Test123"
}
```
Result:
`201 OK`
```
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3MTQxNjU2NTd9.D-zynHqsBcFK5QDHfU6yHPquiNjAS7o8-UPTUo3Dw5Q"
}
```

`401 Unauthrized`
```
{
    "error": "Invalid credentials"
}
```

Get a show by ID 
`GET http://localhost:3000/shows/1`
```
{
    "id": 1,
    "name": "True Lies",
    "genres": [
        "Action",
        "Romance"
    ],
    "show_type": "movie",
    "year": 1993,
    "detail": "Arnold is here"
}
```

Find shows with query params 
`GET http://localhost:3000/shows?genres=Romance&start_year=1960&end_year=2024&show_type=movie`
`200 OK`
```
[
    {
        "id": 1,
        "name": "True Lies",
        "genres": [
            "Romance"
        ],
        "show_type": "movie",
        "year": 1993,
        "detail": "Arnold is here"
    },
    {
        "id": 3,
        "name": "Harry Potter",
        "genres": [
            "Romance"
        ],
        "show_type": "movie",
        "year": 2000,
        "detail": "Harry Potter"
    }
]
```
`200 ok if nothing is found`
```
[]
```

Exisiting add favorite to a show
`POST http://localhost:3000/favorites`
Payload
```
{
    "show": {
        "id": 7
    }
}
```
`200 ok`
```
{
    "message": "Show Iron Man favorited"
}
```
`400 Bad request`
```
{
    "error": "Validation failed: Show Show already been favorited"
}
```
`404 Not found`
```
{
    "error": "Show not found"
}
```