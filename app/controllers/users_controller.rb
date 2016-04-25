class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authorize, :authorized_to_edit, only: [:edit, :update, :show]

  def index
    @students = User.where(admin: false)
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"student-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @enrollments = Enrollment.where(student_id: @user.id)
    @sections = @user.sections
    @enrollment = Enrollment.find_by(id: params[:enrollment_id])
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"#{@user.first_name} #{@user.last_name}-schedule\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end



  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :id_number, :current_homeroom, :password, :admin, :grade_level)
    end

end