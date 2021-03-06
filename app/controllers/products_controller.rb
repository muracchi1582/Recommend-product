class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  
  def index
    @products = Product.all
    return nil if params[:keyword] == ""
    @product = Product.where(['title LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
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

  def search
    @products = Product.where( "title LIKE ? ","%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end
 
  private
  def product_params
    params.require(:product).permit(:title, :movie, :image, :price, :information)
          .merge(user_id: current_user.id)
  end
end
