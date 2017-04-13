class IndicatorValuesController < ApplicationController
   def index
    @indicator = IndicatorValue.all
  end

  def show
    @indicator = IndicatorValue.find(params[:id])
  end

  def new
    @indicator = IndicatorValue.new
  end
  
  def edit
    @indicator = IndicatorValue.find(params[:id])
  end

  def create
    @indicator = IndicatorValue.new(indicator_params)
    @indicator.save

    redirect_to @indicator
  end

  def update
    @indicator = IndicatorValue.find(params[:id])
    @indicator.assign_attributes(indicator_params)
    if @indicator.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end
  end

  def destroy
    @indicator = IndicatorValue.find(params[:id])
    @indicator.destroy

    redirect_to indicators_path
  end

  private
  def indicator_params
    params.require(:indicator_value).permit(:project_id, :indicator_id, :date_i)
  end
end
