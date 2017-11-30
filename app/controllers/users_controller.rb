class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create, :contact_us, :about_us]
  # before_action :already_login
  before_action :authorize, only: [:index, :admin_dashboard, :make_admin]

  def index
     @users = User.search(params[:search])
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
  	@user = User.new(users_params)
    
    if @user.save
      log_in(@user)
      redirect_to welcome_index_path,notice: "thank you!"
    else
      render 'users/new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(users_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def admin_dashboard
    @users = User.all
  end

  def make_admin
    @user = User.find(params[:u_id])
    if @user.update_attribute(:admin, "true")
      flash[:notice] = "Promoted to Admin"
      redirect_to users_path
    else
      flash[:notice] = "Error"
      redirect_to users_path
    end  
  end

  def contact_us
  end

  def about_us
  end

  def help
  end
  
  private
    def users_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :search)
    end

end
