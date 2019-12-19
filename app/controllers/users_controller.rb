class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(current_user.id)
    @products = @user.products
  end

  def show
  end

end
