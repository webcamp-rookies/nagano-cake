class Customer::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
    @ship_cities = current_customer.ship_cities
    def confirm
    @cart_products = current_customer.cart_products
    @order = Order.new(customer: current_customer,
    payment: params[:order][:payment])
    @total_fee = current_customer.cart_products.cart_products_total_price(@cart_products)


      if params[:order][:ship_city] == "ship"
        @order.postcode = current_customer.postcode
        @order.city = current_customer.city
        @order.name = current_customer.last_name + current_customer.first_name

      elsif params[:order][:ship_city] == "select_ship"
        @ship = ShipCity.find(params[:order][:id])
        @order.postcode = @ship.postcode
        @order.city = @ship.city
        @order.name = @ship.name
      elsif params[:order][:ship_city] == "new_ship"
        @order.postcode = params[:order][:postcode]
        @order.city = params[:order][:city]
        @order.name = params[:order][:name]
        @ship = ShipCity.new(ship_params)
        @ship.customer_id = current_customer.id
        @ship.save
      end
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to thanks_orders_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :city, :name, :payment, :total_fee)
  end

  def ship_params
    params.require(:order).permit(:postcode, :city, :name)
  end
end
