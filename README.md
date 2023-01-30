# Widgets - The App For Widgets

This is the end result of the app that is made using [David Bryant Copeland](https://github.com/davetron5000)'s book: [Sustainable Web Development With Ruby on Rails: Practical Tips for Building Web Applications that Last](https://sustainable-rails.com/).

It is a great book with a lot of useful information, great examples, and is written in a conversational tone that makes getting through technical reading very enjoyable. Please support his work if you find this repo helpful.


## Ivo's Notes
Due to Apple Silicon, and my limited knowledge of Docker, I have changed how the app works.
Now, you just run `rails s` and you're ready to work natively on port 3000.
To get back to the Docker setup, change `localhost` to `db` in the `.env.development` and
`env.test` files. Will also want to change the host location of the database in the `bin/psql`
file.

## Setup

1. Pull down the app from version control
2. Make sure you have Postgres running
3. `bin/setup`

## Running The App

1. `bin/run` <- not needed when Docker is ripped out, just use `rails s` (See below)

**Instead**:

### In a terminal tab each:

#### Rails server:
`rails s` <- this will also make debugging easier

#### Run Redis & Sidekiq
- `brew services start redis` - Will start Redis
- `redis-server` - alternative to above (not recommended), but will create `dump.rdb` files, discard these
- `redis-cli ping` - test to see if Redis is running, expected output: `PONG`
- `bin/sidekiq` - Will start Sidekiq (for background jobs), will not start without Redis running

#### To stop Sidekiq & Redis
- `Ctrl+C` - to exit Sidekiq
- `brew services stop redis` - to stop Redis
- `redis-cli shutdown` - use if you used `redis-server` to start redis, will create `dump.rdb` files, discard these


### MailCatcher
- Do not add MailCatcher to your `Gemfile`, this will cause problems
- `gem install mailcatcher` as a system gem instead
- Add this to your `config/development.rb` file:
```
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = { :address => '127.0.0.1', :port => 1025 }
config.action_mailer.raise_delivery_errors = false
```

- See `https://mailcatcher.me/` for more details
- Start MailCatcher with `mailcatcher`

## Tests and CI

1. `bin/ci` contains all the tests and checks for the app
2. `tmp/test.log` will use the production logging format
   *not* the development one

## Production

* All runtime configuration should be supplied in the UNIX environment
* Rails logging uses lograge. `bin/setup help` can tell you how to see this locally