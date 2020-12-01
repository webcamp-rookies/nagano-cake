class ShipCitiesController < ApplicationController
 def index
  @ship_cities = current_customer
  @ship_city = ShipCity.new
 end

 def create
  @ship_city = ShipCity.new(ship_city_params)
  @ship_city.customer.id = current_customer.id
  redirect_to ship_cities_path
 end

 def edit
  @ship_city = ShipCity.find(params[:id])
 end

 def update
  @ship_city = ShipCity.find(params[:id])
  @ship_city.update(ship_city_params)
  redirect_to ship_cities_path
 end

 def destroy
  @ship_city = ShipCity.find(params[:id])
  @ship_city.destroy
  @ship_city = current_customer.city
 end

 private
 def ship_city_params
  params.require(:ship_city).permit(:postcode, :city, :name)
 end
end
