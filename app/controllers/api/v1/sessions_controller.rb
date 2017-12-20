class Api::V1::SessionsController < Api::V1::ApplicationController

   before_action :already_login, except: :destroy
  # after_action :logout, only: :destroy
  skip_before_action :authenticate

  def create
    
    user = User.find_by(email: auth_params[:email])
    if user.authenticate(auth_params[:password])
      jwt = Auth.issue({user: user.id})
       render status: 200, json: {jwt: jwt}
      # current_user(jwt)
      session[:user_id] = user.id
      #token(jwt)
    else
       # render json: {error: "invalid email/password"}, status: 401
    end
  end

  def destroy
    session[:user_id] = nil
    render plain: "logged out"
  end

  private
    def auth_params
      
      params.require("session").permit("email", "password")
    end


end
