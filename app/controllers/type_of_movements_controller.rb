class TypeOfMovementsController < ApplicationController
  before_action :check_user!

  def index
    @typeofM = TypeOfMovement.all
  end

 end
