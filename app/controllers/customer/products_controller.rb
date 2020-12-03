class Customer::ProductsController < ApplicationController
  def top
    @genres = Genre.where(is_active: true)
    @products = Product.all
  end

  def about
  end

  def index
    @genres = Genre.where(is_active: true)
    if params[:genre_id]
		  @genre = Genre.find(params[:genre_id])
		  @products = @genre.products.where(is_active: true)
    else
      @products = Product.where(is_active: true)
    end
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.where(is_active: true)
    @cart_product = CartProduct.new
  end
end
