class CompaniesController < ApplicationController

  before_action :authorize, except: [:index, :show]
  before_action :set_id, only: [:show, :edit, :update, :destroy]
  
  def index
  	@companies = Company.all
  end

  def show
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def new
    @r = Company.pluck(:name, :id)
    @company = Company.new
  end

  def edit
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

    if @company.update(company_params)
      redirect_to companies_show_updated_company_path(c_id: @company.id)
    else
      render 'edit'
    end
  end

  def destroy
  	@company.destroy

  	redirect_to companies_path
  end

  def show_updated_company
    @company = Company.find(params[:c_id])
  end

  def set_id
    @company = Company.find(params[:id])
  end

  private 
    def company_params
    	params.require(:company).permit(:name,:unique_id)
    end


end
