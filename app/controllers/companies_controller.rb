class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update, :destroy]

  def index
    @cart = currentCart
    @companies = Company.all.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @cart = currentCart
    @company = Company.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name)
    end
end