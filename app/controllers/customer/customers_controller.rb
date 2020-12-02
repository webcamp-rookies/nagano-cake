class Customer::CustomersController < ApplicationController
    def edit
        @customer = current_customer
    end
    
    def update
            @customer = current_customer
    	if @customer.update(customer_params)
           flash[:success] = "登録情報を変更しました"
           redirect_to customers_path
        else
           render :edit and return
        end
	end

end
