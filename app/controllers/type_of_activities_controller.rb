class TypeOfActivitiesController < ApplicationController
  before_action :check_user!
 
  def index
    @typeofA = TypeOfActivity.all
  end

  private
  def type_of_activity_params
    params.require(:type_of_activity).permit(:name)
  end
end

