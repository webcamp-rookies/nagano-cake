class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def after_sign_in_path_for(resource)
    if customer_signed_in?
        customer_path(current_customer) #login後遷移path要変更確認用なので
    else
      admin_customers_path #login後遷移path確認用なので要変更
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定 要変更
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
                                        keys: [:last_name, :first_name, :last_name_kana, :email,
                                                :first_name_kana, :postcode, :city, :phone_number ])
  end
end
