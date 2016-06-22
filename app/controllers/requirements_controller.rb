class RequirementsController < ApplicationController
include ApplicationHelper
  def index
    @requirements = Requirement.all
    @student = current_user
  end

end