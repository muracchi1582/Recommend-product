class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @products = Product.limit(4)
  end

  def create
    @product = product.new(product_params)
    @product.save
    redirect_to root_path
  end



  private
  def product_params
    params.require(:product).permit(:title, :movie, :image, :price, :information)
          .merge(user_id: current_user.id)
  end
end
