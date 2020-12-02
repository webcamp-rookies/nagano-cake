class Customer::CustomersController < ApplicationController
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = current_customer
        if @customer.update(customer_params)
        flash[:update] = "You have updated user info successfully."
        redirect_to customer_path(@customer.id)
        else
        render 'edit'
        end
    end
    
    def show
        @customer = current_customer
    end


    private
    def customer_params
    params.require(:customer).permit(:last_name, :first_name, 
                                    :last_name_kana, :first_name_kana,
                                    :email, :postcode, :city, :phone_number)
    end

end
