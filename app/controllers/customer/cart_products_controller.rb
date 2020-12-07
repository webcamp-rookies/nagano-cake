class Customer::CartProductsController < ApplicationController
    
  def index
    @cart_products = current_customer.cart_products
    @cart_product = CartProduct.new
    @total_price = current_customer.cart_products.cart_products_total_price(@cart_products)
  end
    
  def update
    @cart_product = CartProduct.find(params[:id])
    if params[:cart_product][:amount] == "0"
      @cart_product.destroy
      redirect_to cart_products_path
    elsif @cart_product.update(amount: params[:cart_product][:amount])
      redirect_to cart_products_path
    else
      @cart_products = current_customer.cart_products
      @total_price = current_customer.cart_products.cart_products_total_price(@cart_products)
      render "cart_products/index"
    end
  end
    
  def create
    @cart_product = current_customer.cart_products.new(params_cart_product)
    if current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id]).present?
      cart_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
      cart_product.amount += params[:cart_product][:amount].to_i
      cart_product.save
      redirect_to cart_products_path
    elsif @cart_product.save!
      redirect_to cart_products_path
    end
  end
  
  def destroy
    current_customer.cart_products.find(params[:id]).destroy
    redirect_to cart_products_path
  end
  
  def destroy_all
    current_customer.cart_products.destroy_all
    redirect_to cart_products_path
  end
  

  def params_cart_product
  params.require(:cart_product).permit(:amount, :product_id)
  end
  
end
