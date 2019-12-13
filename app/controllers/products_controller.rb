class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @products = Product.limit(4)
  end

  def create
    @product = product_url.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @products = Product.order(created_at: :DESC).limit(4)
    @product = Product.find(params[:id])
  end



  private
  def product_params
    params.require(:product).permit(:title, :movie, :image, :price, :information)
          .merge(user_id: current_user.id)
  end
end
