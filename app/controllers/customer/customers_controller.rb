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
        @customer = Customer.find(params[:id])
    end
    
    def check
        @customer = Customer.find(params[:id])
        #退会ページでユーザーの情報を見つける
    end

    
    def withdraw
        @customer = Customer.find(current_customer.id)
        @customer.update(is_deleted: false)
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end


    private
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, 
                                        :last_name_kana, :first_name_kana,
                                        :email, :postcode, :city, :phone_number)
    end

end
