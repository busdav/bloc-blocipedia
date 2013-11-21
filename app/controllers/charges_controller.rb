class ChargesController < ApplicationController

  def new
  end

  def create
    #Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
      )

    if charge
      current_user.update_attribute(:role, "premium")
      flash[:notice] = "You now have an upgraded account!"
      redirect_to wikis_path
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path

  end
end