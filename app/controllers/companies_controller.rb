class CompaniesController < ApplicationController

  before_action :authorize, except: [:index, :show]
  
  def index
  	@companies = Company.all
  end

  def show
  	@company = Company.find(params[:id])
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def new
    @r = Company.pluck(:name, :id)
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
  	@company = Company.new(company_params)
  	if @company.save
  	  redirect_to companies_path
    else
      render 'new'
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
  	@company = Company.find(params[:id])
  	@company.destroy

  	redirect_to companies_path
  end

  private 
    def company_params
    	params.require(:company).permit(:name,:unique_id)
    end


end
