class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @products = Product.limit(4)
  end

  def create
    Product.create(product_params)
    redirect_to root_path
  end

  def show
    @products = Product.order(created_at: :DESC).limit(4)
    @product = Product.find(params[:id])
  end

  def destroy
    Product.delete(params[:id])
    redirect_to root_path
  end


  private
  def product_params
    params.require(:product).permit(:title, :movie, :image, :price, :information)
          .merge(user_id: current_user.id)
  end
end
