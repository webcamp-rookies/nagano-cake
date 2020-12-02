class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    products_about_path #要変更
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
                                        keys: [:last_name, :first_name, :last_name_kana, :email,
                                                :first_name_kana, :postcode, :city, :phone_number ])
  end
end
