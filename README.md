## Stripe, Devise, Rails

Stripe and Devise integration on a Ruby on Rails APP.  
Demo available at: https://rails-stripe.herokuapp.com

- Ruby 2.2.4
- Rails 4.2.6

## Turbolinks

The call to Stripe.setPublishableKey doesn't work with Turbolinks, as it will be executed before the stripe.js file has finished loading.