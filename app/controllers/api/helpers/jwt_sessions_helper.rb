module Api::Helpers::JwtSessionsHelper
	def logged_in?
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def already_login
      if logged_in?
        #render plain: "hello".inspect
       # redirect_to welcome_index_path
        #flash.now[:danger] = "You are already loged in"
        render plain: "You are logged in"
      end
    end

    def log_in(user)
    	session[:user_id] = user.id
  	end

    # def logout
      # session[:user_id] = nil
    # end

end
