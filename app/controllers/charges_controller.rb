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

    current_user.customer_id = customer.id if current_user
    current_user.save

    Stripe::Charge.create(
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
    customer = Stripe::Customer.create(
        :email => params[:email],
        :source  => params[:stripeToken]
    )

    current_user.customer_id = customer.id if current_user
    current_user.save

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      Stripe::Charge.create(
          :amount => @amount,
          :currency => 'usd',
          :customer => customer.id,
          :description => 'Example charge custom form'
      )
      redirect_to charges_thanks_path

      rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
    end

  end

  def following_purchase
    @amount = 1000
  end

  def charge_following_purchase

    @amount = 1000

    customer_id = current_user.customer_id

    Stripe::Charge.create(
        amount: @amount,
        currency: 'usd',
        customer: customer_id
    )

    flash[:success] = "Enjoy! You just spent #{@amount} cents!"
    redirect_to following_purchase_charges_path

  end

end
