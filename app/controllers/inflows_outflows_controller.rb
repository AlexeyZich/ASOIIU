class InflowsOutflowsController < ApplicationController
  before_action :check_user!

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

    redirect_to project_path(@inflowsoutflow.project)
  end

  def update
    @inflowsoutflow = InflowsOutflow.find(params[:id])
    @inflowsoutflow.assign_attributes(inflowsoutflow_params)
    if @inflowsoutflow.save
      flash[:success] = "Изменения сохранены."
      respond_to do |format|
        format.html { render :show }
        format.json { render :json => { total: @inflowsoutflow.total } }
      end
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      respond_to do |format|
        format.html { render :show }
        format.json { render :json => { total: @inflowsoutflow.total }, status: 400 }
      end
    end
  end

  def export
    puts "test test test "
  end

  def destroy
    @inflowsoutflow = InflowsOutflow.find(params[:id])
    @inflowsoutflow.destroy

    redirect_to inflows_outflows_path
  end

  private
  def inflowsoutflow_params
    params.require(:inflows_outflow).permit(:movement_id, :name, :project_id, :total, :date_f)
  end
end
