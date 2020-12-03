class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
    def index
    @customers = Customer.all
    end
    
	private
	def customer_params
	  params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postcode,:city,:phone_number,:email,:is_deleted)
	end
end
