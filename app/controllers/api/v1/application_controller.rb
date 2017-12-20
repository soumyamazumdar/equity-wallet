class Api::V1::ApplicationController < ActionController::Base 
 
  include Api::Helpers::JwtSessionsHelper
   before_action :authenticate

  def log_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth["user"])
      if user
        @current_user ||= user
      end
    end
  end

  def require_login
      unless logged_in?
        render status: 400, json: {error: "not Logged In"}
        # flash[:error] = "You must be logged in to access this section"
        # redirect_to login_url # halts request cycle
      end
    end

  def authenticate
    render json: {error: "unauthorized"}, status: 401 unless logged_in?
  end

  private

    def token
      request.env["HTTP_AUTHORIZATION"].scan(/Bearer 
        (.*)$/).flatten.last
    end

    def auth
      Auth.decode(token)
    end

    def auth_present?
      !!request.env.fetch("HTTP_AUTHORIZATION", 
        "").scan(/Bearer/).flatten.first
    end

    

end


  /def logged_in?
    !!current_user
  end
  
  def current_user(jwt=nil)
    if jwt.present? 
      user = User.find(auth(jwt)["user"])
      if user
        @current_user ||= user
      end
    end
  end
  
  def authenticate
    render json: {error: "unauthorized"}, status: 401 
      unless logged_in?
      end  
  end

  private

    def auth(jwt)
      Auth.decode(jwt)
    end/



