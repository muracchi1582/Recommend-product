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
    History.create(
      user_id: current_user.id,
      product_id: params[:product_id],
    )
  end

  def history

    @histories = current_user.products
  end

end
