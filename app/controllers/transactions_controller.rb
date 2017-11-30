class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
  	#@company_id = params[:compa_id]
    @user_id = params[:user_id]
    @stock_id = params[:stock_id]
    @stock = Stock.find(params[:stock_id])
    @stav = @stock.stocks_available
    @company_id = Stock.find_by_id(@stock_id).company.id
    @transaction = Transaction.new
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(transactions_params)
    if @transaction.save

       @price = Stock.find(@transaction.stock_id).price 
       @tcost = @transaction.stocks_bought*@price
       @transaction.total_cost = @tcost
       @transaction.save 

      redirect_to stocks_update_stocks_available_path(t_id: @transaction.id)
    else
      redirect_to companies_path,flash: {success: "not created!!"}
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    @stock = Stock.find(@transaction.stock_id)
    if @transaction.update(transactions_params)
      @transaction.stocks_sold_count += @transaction.stocks_sold
      @transaction.sold_total += @transaction.stocks_sold*@stock.price
      @transaction.save
      @stock.stocks_available = @stock.stocks_available+@transaction.stocks_sold
      @stock.save
      redirect_to transactions_path, flash: {success: "Stock Sold!!" }
    else
      render 'edit'
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    redirect_to transactions_path
  end

  def view_user_transaction
  end

  def companywise_stocks_bought
    
  end

  def stockwise_total_transaction
    @st = Stock.find(params[:s])
  end

  def total_purchase_sale
  end

  def sell_stock
    @transaction = Transaction.find(params[:t_id])
  end

  def update_number_of_stock
    @transaction = Transaction.find(params[:t_id])
  end

  def success
    @transaction = Transaction.find(params[:t_id])
  end

  private
    def transactions_params
      params.require(:transaction).permit(:stocks_bought, :total_cost, :comp_id, :stock_id, :user_id, :Purchasetotal,:stocks_sold)
    end

end