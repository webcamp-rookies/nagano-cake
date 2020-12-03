class Admin::ProductsController < ApplicationController
   # before_action :authenticate_admin! 管理者用！！！！変更！！！
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
  end
  def edit
  end
  def update
  end
  
  private
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # end
  def product_params
    params.require(:product).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end
end