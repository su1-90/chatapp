class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected


    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :profile_image])
        devise_parameter_sanitizer.permit(:account_update, keys: [:profile_image])
    end

    # ログイン後のページ遷移指定
    def after_sign_in_path_for(resource)
        chats_path
    end
    
end
