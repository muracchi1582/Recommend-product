class PurchaseController < ApplicationController
  
  require 'payjp'
  
  def index
    @user = User.find(current_user.id)
    @product = Product.find(params[:product_id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_user_card_path(@user)
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @product = Product.find(params[:product_id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      customer: card.customer_id,
      currency: :'jpy',
    )
    if @product.save
      redirect_to action: 'done'
    else
     redirect_to root_path
    end 
  end

  def done
  end

  def history
    @user = User.find(current_user.id)
    @products = @user.products
    @histories = @products
  end
end
