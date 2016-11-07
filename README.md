# README

## About

This is a Rails 5 application that implements a basic RESTful JSON api for an
ecommerce service.

While I'd typically have considered something like
[Sinatra](http://www.sinatrarb.com/) or [Express](http://expressjs.com/) for
creating this type of API, I was curious to try the new
[api mode](http://guides.rubyonrails.org/api_app.html) added to Rails in
version 5. This disables significant portions of the default Rails frameworks
to reduce the surface of your application, while still providing features that
more minimal alternatives may not.

The API is stateless, which should help with any future scaling, and quite
small in terms of the number of methods available. For a full list of API
methods, run the `bin/rails routes` command, or see the Examples section
later in this doc.

### Security

As per the brief this application doesn't include any security considerations,
but here is what I'd plan to address in a future iteration:

* *Authentication*. A login mechanism would be implemented to allow us to ask
a Shopper to verify their credentials, in return for which they would be given
a time-limited token such as [JSON Web Tokens](https://jwt.io/). This
token would then be supplied along with any API requests to protected methods
made on behalf of that Shopper, and would be validated before the API would
respond.

* *Authorisation*. As well as authorisation, the application would have the
concept of authorisation. For example, a regular Shopper should not be able
to manipulate product data regardless of whether they're authenticated.

* *CORS*. All of my API test calls have originated from the same host as the
API, but in the real world we'd need to permit access from external hosts.
Typically we would look to expose as little as possible to as few hosts as
possible.

* *SSL and HTTP Security Headers*. Serving the API over SSL should be a
requirement for the production environment, and the various HTTP Security
headers should also be properly configured.

* *Input validation*. Ensure all user inputs are appropriately filtered or
sanitised, and consider fuzz testing the inputs to look for unexpected
behaviour in response to unexpected inputs.

* *API Throttling and Blocking*. When exposing an API on a public network, it's
typically advisable to have an automated mechanism for throttling - limiting
the number of requests a particular client can make in a period of time - and
blocking.

* *Database*. We're currently using MongoDB in it's default state, but would
configure authentication and access control settings at a minimum.

* *Encryption at rest*. Depending on the data being stored, it may be a
requirement to ensure that it's encrypted at rest.

## Setup

### Docker

```bash
RAILS_ENV=development docker-compose build
RAILS_ENV=development docker-compose run app bin/rails db:seed
RAILS_ENV=development docker-compose up -d
```

The app should now be visible on your host at http://127.0.0.1:3000

### Manual

1. Install [MongoDB](https://docs.mongodb.com/manual/installation/) on your
system and amend `config/mongoid.yml` to match the connection details of your
install (particularly hostname, which is currently set for Docker).

2. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
2.3.0 or later on your system.

3. Install [Bundler](https://bundler.io/) via Rubygems: `gem install bundler`

4. Run `bundle install` to install the application's dependencies.

## Usage

### Running the tests

Tests are written with the [Minitest](https://github.com/seattlerb/minitest)
framework that ships with Rails.

```bash
bin/rails t
```

### Seed the database

Before running the API and making requests, you can automatically seed the
database with some products by running the following command.

```bash
bin/rails db:seed
```

### Starting the webserver

This will default to development mode and bind to http://127.0.0.1:3000, after
which you can interact with the API from the command line with `curl` or with
an app like [Postman](https://www.getpostman.com/).

```bash
bin/rails s
```

## Examples

### Retrieve all Products (GET)

```bash
curl http://127.0.0.1:3000/api/products
```

```json
[
  {
    "id": "581f75fa79b46b17396f99c5",
    "name": "Ardbeg Uigeadail",
    "description": "Uigeadail derives from the Scotch Gaelic for 'Dark and Mysterious Place' and is named for the Loch from whence Ardbeg draws its waters. Jim Murray's 2009 World Whisky of the Year, this cask-strength bottle exudes breathtaking balance.",
    "price": 5295,
    "display_price": "£52.95"
  }
]
```

### Create a Shopper (POST)

```bash
curl -d "name=cameron&email=test@example.org" http://127.0.0.1:3000/api/shoppers
```

```json
{
  "id": "581f793779b46b1823995016",
  "name": "Test User",
  "email": "test@example.org",
  "basket": {
    "id": "581f793779b46b1823995017",
    "items": []
  }
}
```

### Update a Shopper (PUT)

```bash
curl -X PUT -d "name=Mr Test User" http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016
```

```json
{
  "id": "581f793779b46b1823995016",
  "name": "Mr Test User",
  "email": "test@example.org",
  "basket": {
    "id": "581f793779b46b1823995017",
    "items": []
  }
}
```

### Get Basket contents (GET)

```bash
curl http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016/basket
```

```json
{
  "id": "581f793779b46b1823995017",
  "items": []
}
```

### Update Basket (PUT)

```bash
curl -X PUT -d "product_ids[]=581f75fa79b46b17396f99c5" \
  http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016/basket
```

```json
{
  "id": "581f793779b46b1823995017",
  "items": [
    {
      "_id": "581f7a1d79b46b1823995018",
      "product_id": "581f75fa79b46b17396f99c5"
    }
  ]
}
```

### Empty Basket (DELETE)

```bash
curl -X DELETE http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016/basket
```

```json

```

### Checkout (POST)

```bash
curl -d "" http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016/checkout
```

```json
{
  "id": "581f7a8a79b46b182399501a",
  "total": 5295,
  "line_items": [
    {
      "id": "581f7a8a79b46b182399501b",
      "quantity": 1
    }
  ]
}
```
