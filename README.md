![logo stripe][logo-stripe] ![logo devise][logo-devise]

## Stripe, Devise, Rails

Stripe and Devise integration on a Ruby on Rails APP.  
Demo available at: https://rails-stripe.herokuapp.com

- Ruby 2.2.4
- Rails 4.2.6

## Turbolinks disabled

The call to Stripe.setPublishableKey doesn't work with Turbolinks, as it will be executed before the stripe.js file has finished loading.

[logo-stripe]: https://stripe.com/img/about/logos/logos/black.png "Logo Stripe"
[logo-devise]: https://raw.githubusercontent.com/plataformatec/devise/master/devise.png "Logo Devise"