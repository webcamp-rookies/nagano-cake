class Customer::CartProductsController < ApplicationController
    
    def index
      @cart_products = current_customer.cart_products
      @cart_product = CartProduct.new
    end
    
    def update
    end
    
    def create
    @cart_product = current_customer.cart_products.new(params_cart_product)
    @cart_product.save!
    redirect_to cart_products_path
    end
    
    def destroy
    current_customer.cart_products.find(params[:id]).destroy
    redirect_to cart_products_path
    end
    
    def destroy_all
    end
    
    
  
    def params_cart_product
    params.require(:cart_product).permit(:amount, :product_id)
    end
    
end
