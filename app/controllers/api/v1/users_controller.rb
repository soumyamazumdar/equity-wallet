class Api::V1::UsersController < ApiController
  
  before_action :set_id,only: [:show, :edit, :update, :destroy]

  def index
  	render json: User.all
  end

  def show
    render json: @user, include: ['stocks','transactions']
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render status: 200, json: @user
    else
      render status: 400, json: {errors: @user.errors.full_message}
    end
  end

  def update
      if @user.update(transaction_params)
        flash[:notice] = "user was successfully updated."
      end
      render json: @user, location: root_url
    end

    def destroy
      @user.destroy
    
      flash[:notice] = "transaction was successfully destroyed."
    
      render json: @user
    end

  private
    def set_id
    	@user = User.find(params[:id])
    end
    
end