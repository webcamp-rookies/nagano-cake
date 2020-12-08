class Customer::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
    @ship_cities = current_customer.ship_cities
  end

  def confirm
    @cart_products = current_customer.cart_products
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to orders_thanks_path
  end

  def index
    @orders = current_customer.orders
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :city, :name, :payment, :total_price)
  end
end
