class PeriodsController < ApplicationController
  include ApplicationHelper
  before_action :find_periods

  def index
  end

  def show
    @period = Period.find(params[:id])
  end

end