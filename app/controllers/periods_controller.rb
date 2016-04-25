class PeriodsController < ApplicationController

  def index
    @periods = Period.all
  end

  def show
    @periods = Period.all
    @period = Period.find(params[:id])
  end

end