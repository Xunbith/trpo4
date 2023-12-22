class Users::SessionsController < Devise::ApplicationController
    def destroy
      sign_out(current_user) # Выход пользователя из аккаунта
      redirect_to root_path # Редирект на главную страницу или другую страницу на ваш выбор
    end
  end