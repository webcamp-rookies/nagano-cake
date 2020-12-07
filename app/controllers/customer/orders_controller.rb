class Customer::OrdersController < ApplicationController
    
    def new
        @order = Order.new
        @customer = current_customer
        @ship_cities = current_customer.ship_cities
    end
    
    def create
    end
    
    def index
        @orders = current_customer.orders.all
    end
    
    def show
    end
    
    def thanks
    end
    
    def confirm
    end
    
    
    
end
