class EnrollmentsController < ApplicationController
  include EnrollmentHelper
  before_action :find_user, :find_course, :find_section



  def new
    @enrollment = Enrollment.new(student_id: @user_id)
  end

  def create
    @enrollment = Enrollment.new(student_id: @user.id, section_id: @section.id)
    if enrolled(@user, @section.code, @course.number)
      render 'enrolled'
    elsif  period_conflict(@user, @section.period_id)
      render 'period_conflict'
    else
      if @enrollment.save
        @section.check_section_seats
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end
  end

  def destroy
    @enrollment = Enrollment.find_by(id: params[:id])
    @section.reset_section
    @enrollment.destroy
    redirect_to user_path(@user)
  end

  def all
    @students = User.where(admin: false)
    @enrollments = Enrollment.all
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachemnt; filename = 'all-student-enrollments-list.xlsx"
      }
    end
  end

  def master
    @enrollments = Enrollment.all.sort_by { |e| e.section.name}
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachemnt; filename = 'enrollment-master-list.xlsx"
      }
    end
  end

end