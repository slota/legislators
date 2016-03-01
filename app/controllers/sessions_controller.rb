class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_oauth(request.env["omniauth.auth"])
    if user
      session[:user_id] = user.id
      redirect_to welcome_path(user.id)
    else
      redirect_to '/'
    end
  end

  def destroy
  end
end
