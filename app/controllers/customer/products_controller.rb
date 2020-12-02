class Customer::ProductsController < ApplicationController
  def top
    @genres = Genre.where(is_active: true)
  end
  def about
  end
  def index
  end
  def show
  end
end
