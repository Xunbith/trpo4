class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # Override default create method
    def create
        super do |user|
            user.add_role Role.find(params[:user][:role_ids]).name
        end
    end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end
end