class TypeOfDecisionsController < ApplicationController
  before_action :check_user!

  def index
    @typeofD = TypeOfDecision.all
  end

  def show
    @typeofD = TypeOfDecision.find(params[:id])
  end

  def new
    @typeofD = TypeOfDecision.new
  end
  
  def edit
    @typeofD = TypeOfDecision.find(params[:id])
  end

  def create
    @typeofD = TypeOfDecision.new(type_of_decision_params)
    @typeofD.save

    redirect_to @typeofD
  end

  def update
    @typeofD = TypeOfDecision.find(params[:id])
    @typeofD.assign_attributes(type_of_decision_params)
    if @typeofD.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end
  end

  def destroy
    @typeofD = TypeOfDecision.find(params[:id])
    @typeofD.destroy

    redirect_to type_of_decisions_path
  end

  private
  def type_of_decision_params
    params.require(:type_of_decision).permit(:name)
  end
end
