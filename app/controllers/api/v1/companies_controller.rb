class Api::V1::CompaniesController < Api::V1::ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def index
  	render json: Company.all
  end

  def show
  	render json: @company, include: ['stocks']
  end

  def new
    @company = Company.new(company_params)
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      render status: 200, json: @company
    else
      render status: 400, json: {errors: @company.errors.full_message}
    end
  end

  def update
    if @company.update(company_params)
      flash[:notice] = "company was successfully updated."
    end
    render json: @company, location: root_url
  end

  def destroy
    @company.destroy
    
    flash[:notice] = "company was successfully destroyed."
    
    render json: @company
  end

  private
  
    def set_id
    	@company = Company.find(params[:id])
    end
    
end