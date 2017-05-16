class DecisionsController < ApplicationController
  before_action :check_user!

  def index
    @decision = Decision.all
  end

  def show
    @decision = Decision.find(params[:id])
  end

  def new
    @decision = Decision.new
  end
  
  def edit
    @decision = Decision.find(params[:id])
  end

  def create
    @decision = Decision.new(decision_params)
    if @decision.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end

  end

  def update
    @decision = Decision.find(params[:id])
    @decision.assign_attributes(decision_params)
    if @decision.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end
  end

  def destroy
    @decision = Decision.find(params[:id])
    @decision.destroy

    redirect_to decisions_path
  end

  private
  def decision_params
    params.require(:decision).permit(:project_id, :collegial_id, :type_decision_id, :date_d)
  end
end
