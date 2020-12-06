class Customer::CartProductsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
  end

  def update
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:customer_id,:amount,:product_id)
  end

end