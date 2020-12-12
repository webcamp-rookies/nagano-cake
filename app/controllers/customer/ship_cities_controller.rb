class Customer::ShipCitiesController < ApplicationController
  before_action :authenticate_customer!

 def index
  @ship_cities = current_customer.ship_cities
  @ship_city = ShipCity.new
 end

 def create
  @ship_city = ShipCity.new(ship_city_params)
  @ship_city.customer_id = current_customer.id
  if @ship_city.save
   flash[:notice] = "You have created Shipping address successfully."#英語に統一
   redirect_to ship_cities_path
  else
   @ship_cities = current_customer.ship_cities
   render 'index'
  end
 end

 def edit
  @ship_city = ShipCity.find(params[:id])
 end

 def update
  @ship_city = ShipCity.find(params[:id])
   if @ship_city.update(ship_city_params)
     flash[:notice] = "Shipcity was successfully updated"
     redirect_to ship_cities_path
   else
     render "edit"
   end
 end

 def destroy
  @ship_city = ShipCity.find(params[:id])
  @ship_city.destroy
  @ship_city = current_customer.ship_cities
  flash[:notice] = "Shipcity was successfully deleted"
  redirect_to ship_cities_path
 end

 private
 def ship_city_params
  params.require(:ship_city).permit(:postcode, :city, :name)
 end
end
