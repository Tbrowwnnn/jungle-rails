# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. It is a clone of website that sells different types of plants. Users can create an account and sign in to purchase different types of plants. Admin can edit different products made available as well as categories. 

## Improvements

-bug fixes such as out of stock badge present preventing user purchase if stock is at 0 quantity and lack of checkout cart if cart is empty as well as prices now displaying correctly.

-Ordering plants now has a checkout screen displaying items purchased, name, email, and total cost. 

-About page created and routed. 

-Admin can create new categories if need be for different kinds of plants as well as add new products to database.

-Users can now choose to create an account as long as minimum requirements are met such as users requiring a unique name and email. 

-Passwords are encrypted and emails are not subject to additional spaces or are case sensitive. 

-User can login to an existing account and name will display in the navigation header with a logout button that allows the user to log out. 

## Screenshots


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe


