class UsersController < ApplicationController
  include ApplicationHelper
  include UserHelper
  before_action :authorize, :authorized_to_edit, only: [:edit, :update, :show]

  def index
    @students = User.where(admin: false)
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers["Content-Disposition"] = "attachement; filename = all-students.xlsx"
      }
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
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename = #{@user.first_name}_#{@user.last_name}_Schedule.xlsx"
      }
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
    if @user.update(confirm_params)
      flash[:message] = "Your schedule has been confirmed.
                         Please contact an administrator to make any changes."
      redirect_to user_path
    elsif @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    reset_user_sections(@user)
    @user.destroy
    redirect_to users_path
  end




  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :id_number, :current_homeroom, :password, :admin, :grade_level)
    end

    def confirm_params
      params.permit(:schedule_confirmed)
    end

end