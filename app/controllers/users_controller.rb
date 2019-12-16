class UsersController < ApplicationController

  
  def index
    @user = User.find(current_user.id)
    @products = @user.products
  end

  def show
  end

  def history
    @histories = History.all
  end

end
