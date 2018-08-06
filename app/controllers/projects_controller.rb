class ProjectsController < ApplicationController
  before_action :check_user!

  def index
    @project = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @activities = TypeOfActivity.all
    @inflowsoutflow = InflowsOutflow.new
  end

  def new
    @project = Project.new
    @inflowsoutflow = InflowsOutflow.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.save

    redirect_to @project
  end

  def update
    @project = Project.find(params[:id])
    @project.assign_attributes(project_params)
    if @project.save
      flash[:success] = "Изменения сохранены."
      render :show
    else
      flash[:error] = "Ошибка! Изменения не сохранены"
      render :show
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :currency, :date_p)
  end
end
