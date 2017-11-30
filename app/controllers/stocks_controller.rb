class StocksController < ApplicationController

  before_action :authorize, except: [:index, :show, :user_specific_stocks, :update_stocks_available]

  def index
  	@stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new
  	@company = Company.find(params[:company_id])
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def create 
  	@company = Company.find(params[:company_id])
  	@stock = @company.stocks.create(stocks_params)
  	redirect_to company_path(@company)
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update(stocks_params)
      redirect_to @stock
    else
      render 'edit'
    end
  end

  def destroy
  	@company = Company.find(params[:comp_id])
    @st = Stock.find(params[:id])
  	@st.destroy
  	  redirect_to company_path(@company)
  end

  
  def update_stocks_available
    @transaction = Transaction.find(params[:t_id])
    @transaction.stocks_sold ||= 0
    @stock = Stock.find(@transaction.stock_id)
    @stock.stocks_available = @stock.stocks_available-@transaction.stocks_bought
    if @stock.save
        redirect_to transactions_success_path(t_id: @transaction)
    end
  end

  def user_specific_stocks
    @comp = Company.find(params[:c])
  end


  private
    def stocks_params
    	params.require(:stock).permit(:name,:total_stocks,:stocks_available,:price,:stocks_sold)
    end

end
