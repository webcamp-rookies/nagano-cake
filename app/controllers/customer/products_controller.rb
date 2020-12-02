class Customer::ProductsController < ApplicationController
  def top
    @genres = Genre.where(is_active: true)
    @products = Product.all
  end

  def about
  end

  def index
    @product = Product.find(params[:id])
    @genres = Genre.where(is_active: true)
  end

  def show
    @product = Product.find(params[:id])
   @genres = Genre.where(is_active: true)
  end
end
