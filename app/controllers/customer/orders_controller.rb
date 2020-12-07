class Customer::OrdersController < ApplicationController

  def index
    @orders = current_customer.orders.all
  end


  def new
    @order = Order.new
    @customer = current_customer
    @ship_cities = current_customer.ship_cities
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id

    if @order.save
      current_customer.cart_products.destroy_all
      redirect_to orders_thanks_path
    else
      render :confirm
    end
  end




  def show
  end

  def confirm
    @cart_products = current_customer.cart_products
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.payment = params[:order][:payment]
    @total_price = current_customer.cart_products.cart_products_total_price(@cart_products)
    @order.shipping = 800

    if params[:order][:city_option] == "0"
      @order.postcode = current_customer.postcode
      @order.city = current_customer.city
      @order.name = current_customer.last_name + " " + current_customer.first_name
      render 'confirm'
    elsif params[:order][:city_option] == "1"
      @ship_city = ShipCity.find(params[:order][:id])
      @order.postcode = @ship_city.postcode
      @order.city = @ship_city.city
      @order.name = @ship_city.name
      render 'confirm'
    elsif params[:order][:city_option] == "2"
      @ship_city = current_customer.ship_cities.new(ship_city_params)
      @ship_city.save
      @order.postcode = @ship_city.postcode
      @order.city = @ship_city.city
      @order.name = @ship_city.name
      render 'confirm'
    else
      render :new
    end
  end


  def thanks
  end

  def order_params
    params.permit(:payment, :postcode, :city, :name, :shipping, :total_fee)
  end

  def ship_city_params
    params.require(:ship_city).permit(:postcode, :city, :name)
  end



end
