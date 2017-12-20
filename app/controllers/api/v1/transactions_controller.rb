class Api::V1::TransactionsController < Api::V1::ApplicationController
	before_action :set_id, only: [:show, :edit, :update, :destroy]

	def index
		render json: Transaction.all
	end

	def show
		render json: @transaction
	end

	def create
		@transaction = Transaction.new(transaction_params)

		if @transaction.save
			render status: 200, json: @transaction
		else
			render status: 400, json: {errors: @transaction.errors.full_message}
		end
	end

	def update
      if @transaction.update(transaction_params)
        flash[:notice] = "transaction was successfully updated."
      end
      render json: @transaction, location: root_url
    end

    def destroy
      @transaction.destroy
    
      flash[:notice] = "transaction was successfully destroyed."
    
      render json: @transaction
    end

	private

	  def set_id
	  	@transaction = Transaction.find(params[:id])
	  end

	  def transaction_params
	  	params.require(:transaction).permit(:stocks_bought, :total_cost, :comp_id, :stock_id, :user_id, :Purchasetotal, :stocks_sold)
	  end
	  	
end