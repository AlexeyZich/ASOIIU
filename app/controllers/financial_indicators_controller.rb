class FinancialIndicatorsController < ApplicationController
  before_action :check_user!

  def index
    @f_indicator = FinancialIndicator.all
  end

end
