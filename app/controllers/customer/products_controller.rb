class Customer::ProductsController < ApplicationController


  def top
    @genres = Genre.where(is_active: true)
    @products = Product.all
    @random = Product.order("RANDOM()").limit(4)
  end

  def about
  end

  def index
    @genres = Genre.where(is_active: true)
    if params[:genre_id]
		  @genre = Genre.find(params[:genre_id])
		  @products = @genre.products.where(is_active: true).page(params[:page]).reverse_order
    else
      @products = Product.where(is_active: true).page(params[:page]).reverse_order
    end
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.where(is_active: true)
    @cart_product = CartProduct.new
  end

  	private
	def params_product
		parmas.require(:product).permit(:image ,:name )
	end

end


