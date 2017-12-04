class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_login
  before_action :set_last_seen_at, if: proc { logged_in? }

private

	def authorize
		if !@current_user.admin?
			flash[:error] = "You must be an admin to access this section"
			redirect_to welcome_index_path 
		end
	end

	def set_last_seen_at
      current_user.update_column(:last_seen_at, Time.current)
	end

 
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_url # halts request cycle
      end
    end

end
