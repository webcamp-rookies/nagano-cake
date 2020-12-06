class Customer::CartProductsController < ApplicationController
  before_action :set_cart
  
  def index
  end
  def update
  end
  def create
  end
  def destroy
  end
  def destroy_all
  end
end

private
def set_cart
  @cart = current_cart
end
