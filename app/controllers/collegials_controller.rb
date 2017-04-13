class CollegialsController < ApplicationController
  def index
    @collegial = Collegial.all
  end

  def show
    @collegial = Collegial.find(params[:id])
  end

  def new
    @collegial = Collegial.new
  end
  
  def edit
    @collegial = Collegial.find(params[:id])
  end

  def create
    @collegial = Collegial.new(collegial_params)
    @collegial.save

    redirect_to @collegial
  end

  def update
    @collegial = Collegial.find(params[:id])
    @collegial.assign_attributes(collegial_params)
    if @collegial.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end
  end

  def destroy
    @collegial = Collegial.find(params[:id])
    @collegial.destroy

    redirect_to collegial_index_path
  end

  private
  def collegial_params
    params.require(:collegial).permit(:name, :address, :phone)
  end
end
