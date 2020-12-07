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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_products = current_customer.cart_products
    @order.save
      #カートの中の情報をひとつづつ保存
      # @cart_products.each do |cart_product|
      #   order_detail = OrderProduct.new(order_id: @order.id)
      #   order_detail.price = cart_product.product.price
      #   order_detail.amount = cart_product.amount
      #   order_detail.product_id = cart_product.product_id
      #   order_detail.save!
      # end
      #保存後カートの中を空にする
    @cart_products.destroy_all
    redirect_to orders_thanks_path
  end





  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @order_details.order_id = @order.id
  end

  def confirm
    @cart_products = current_customer.cart_products
    @order = Order.new(order_params)
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
      @ship_city = ShipCity.find(params[:order][:ship_city])
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

  private

  def order_params
    params.require(:order).permit(:payment, :postcode, :city, :name, :shipping, :total_fee)
  end

  def ship_city_params
    params.require(:ship_city).permit(:postcode, :city, :name)
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :customer_id)
  end


end
