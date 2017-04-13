class InflowsOutflowsController < ApplicationController
  def index
    @inflowsoutflow = InflowsOutflow.all
  end

  def show
    @inflowsoutflow = InflowsOutflow.find(params[:id])
  end

  def new
    @inflowsoutflow = InflowsOutflow.new
  end
  
  def edit
    @inflowsoutflow = InflowsOutflow.find(params[:id])
  end

  def create
    @inflowsoutflow = InflowsOutflow.new(inflowsoutflow_params)
    @inflowsoutflow.save

    redirect_to @inflowsoutflow
  end

  def update
    @inflowsoutflow = InflowsOutflow.find(params[:id])
    @inflowsoutflow.assign_attributes(inflowsoutflow_params)
    if @inflowsoutflow.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end
  end

  def destroy
    @inflowsoutflow = InflowsOutflow.find(params[:id])
    @inflowsoutflow.destroy

    redirect_to inflowsoutflows_path
  end

  private
  def inflowsoutflow_params
    params.require(:inflows_outflow).permit(:movement_id, :project_id, :total, :date_f)
  end
end
