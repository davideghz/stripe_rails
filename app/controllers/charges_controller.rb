class ChargesController < ApplicationController

  def thanks

  end

  def checkoutjs
    @amount = 99
  end

  def customform
    @amount = 99
  end

  def create
    # Amount in cents
    @amount = 99

    customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Example charge checkout.js',
        :currency    => 'usd'
    )
    redirect_to charges_thanks_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path

  end

  def charge_customform
    # Amount in cents
    @amount = 99

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
          :amount => @amount,
          :currency => 'usd',
          :source => token,
          :description => 'Example charge custom form'
      )
      redirect_to charges_thanks_path

      rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
    end

  end

end
