class CoursesController < ApplicationController
  include ApplicationHelper
  include CourseHelper
  before_action :admin_auth?, except: [:index, :show]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id: params[:id])
    @sections = @course.sections
    @students = @course.students
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find_by(id: params[:id])
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      @course.set_department(params[:course][:department_id])
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find_by(id: params[:id])
    @course.destroy
    redirect_to courses_path
  end

  def master
    @courses = Course.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"courses-master\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  private
    def course_params
      params.require(:course).permit(:name, :number, :title, :description, :prereq)
    end
end