class TypeOfMovementsController < ApplicationController
  before_action :check_user!

  def index
    @typeofM = TypeOfMovement.all
  end

  def show
    @typeofM = TypeOfMovement.find(params[:id])
  end

  def new
    @typeofM = TypeOfMovement.new
  end
  
  def edit
    @typeofM = TypeOfMovement.find(params[:id])
  end

  def create
    @typeofM = TypeOfMovement.new(type_of_movement_params)
    @typeofM.save

    redirect_to @typeofM
  end

  def update
    @typeofM = TypeOfMovement.find(params[:id])
    @typeofM.assign_attributes(type_of_movement_params)
    if @typeofM.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end
  end

  def destroy
    @typeofM = TypeOfMovement.find(params[:id])
    @typeofM.destroy

    redirect_to type_of_movements_path
  end

  private
  def type_of_movement_params
    params.require(:type_of_movement).permit(:name, :activity_id)
  end
end
