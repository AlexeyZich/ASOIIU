class TypeOfActivitiesController < ApplicationController
  def index
    @typeofA = TypeOfActivity.all
  end

  def show
    @typeofA = TypeOfActivity.find(params[:id])
  end

  def new
    @typeofA = TypeOfActivity.new
  end
  
  def edit
    @typeofA = TypeOfActivity.find(params[:id])
  end

  def create
    @typeofA = TypeOfActivity.new(type_of_activity_params)
    @typeofA.save

    redirect_to @typeofA
  end

  def update
    @typeofA = TypeOfActivity.find(params[:id])
    @typeofA.assign_attributes(type_of_activity_params)
    if @typeofA.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end
  end

  def destroy
    @typeofA = TypeOfActivity.find(params[:id])
    @typeofA.destroy

    redirect_to type_of_activities_path
  end

  private
  def type_of_activity_params
    params.require(:type_of_activity).permit(:name)
  end
end

