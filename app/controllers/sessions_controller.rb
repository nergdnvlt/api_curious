class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.uid
    session[:token] = request.env['omniauth.auth']['credentials']['token']
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
