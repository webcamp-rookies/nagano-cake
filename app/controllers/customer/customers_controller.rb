class Customer::CustomersController < ApplicationController
    
    def edit
    @customer = current_customer
    end
    
    def show
    @customer = current_customer
    end

end
