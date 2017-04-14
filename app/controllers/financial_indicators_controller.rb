class FinancialIndicatorsController < ApplicationController
  before_action :check_user!

  def index
    @f_indicator = FinancialIndicator.all
  end

  def show
    @f_indicator = FinancialIndicator.find(params[:id])
  end

  def new
    @f_indicator = FinancialIndicator.new
  end
  
  def edit
    @f_indicator = FinancialIndicator.find(params[:id])
  end

  def create
    @f_indicator = FinancialIndicator.new(f_indicator_params)
    @f_indicator.save

    redirect_to @f_indicator
  end

  def update
    @f_indicator = FinancialIndicator.find(params[:id])
    @f_indicator.assign_attributes(f_indicator_params)
    if @f_indicator.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end
  end

  def destroy
    @f_indicator = FinancialIndicator.find(params[:id])
    @f_indicator.destroy

    redirect_to financial_indicators_path
  end

  private
  def f_indicator_params
    params.require(:financial_indicator).permit(:name)
  end
end
