class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        redirect_to edit_user_registration_path
    end
end