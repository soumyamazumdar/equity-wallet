class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  before_action :already_login, except: :destroy
  after_action :logout, only: :destroy

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to welcome_index_path
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


end
