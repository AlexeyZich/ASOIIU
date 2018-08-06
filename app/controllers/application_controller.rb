class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def check_user!
    redirect_to root_path unless user_signed_in?
  end
end
