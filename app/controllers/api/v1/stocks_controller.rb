class Api::V1::StocksController < ApiController
	before_action :set_id, only: [:show, :edit, :update, :destroy]
   
    def index
    	render json: Stock.all
    end

	def show
		render json: @stock, include: ['transactions', 'users']
	end

	def create
		@stock = Stock.new(stock_params)

		if @stock.save
			render status: 200, json: @stock
		else
			render status: 400, json: {errors:@stock.errors.full_message }
		end
	end


  def update
    if @stock.update(stock_params)
      flash[:notice] = "Stock was successfully updated."
    end
    render json: @book, location: root_url
  end

  def destroy
    @stock.destroy
    
    flash[:notice] = "Stock was successfully destroyed."
    
    render json: @book
  end

	private
	  def set_id
	  	@stock = Stock.find(params[:id])
	  end

	  def stock_params
	  	params.require(:stock).permit(:name, :total_stocks, :stocks_available, :price, :company_id)
	  end

end