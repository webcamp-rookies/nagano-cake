class Admin::ProductsController < ApplicationController
  # before_action :if_not_admin

  def top
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render "show"
    end
  end
  
  private
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # end
  def product_params
    params.require(:product).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end
end