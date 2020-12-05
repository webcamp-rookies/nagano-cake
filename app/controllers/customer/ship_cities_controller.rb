class Customer::ShipCitiesController < ApplicationController
  before_action :authenticate_customer!
  #あとでコメント状態解除
 def index
  @ship_cities = ShipCity.all#あとで削除
  #@ship_cities = current_customer　あとでコメント状態解除
  @ship_city = ShipCity.new
 end

 def create
  @ship_city = ShipCity.new(ship_city_params)
  #@ship_city.customer.id = current_customer.id あとでコメント状態解除
  @ship_city.save
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
  #@ship_city = current_customer.city あとで削除
  redirect_to ship_cities_path
 end

 private
 def ship_city_params
  params.require(:ship_city).permit(:postcode, :city, :name)
 end
end
