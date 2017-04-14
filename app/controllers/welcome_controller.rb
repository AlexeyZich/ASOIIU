class WelcomeController < ApplicationController
  before_action :check_user!

  def index
    redirect_to new_user_session_path 
  end

  protected

  def check_user!
    redirect_to projects_path if user_signed_in?
  end
end
