class SectionsController < ApplicationController
  include ApplicationHelper
  before_action :admin_auth?, except: [:all]
  before_action :find_course, except: [:all]
  before_action :find_section, only: [:edit, :update, :show]


  def show
    @section = Section.find_by(id: params[:id])
    @students = @section.students
    # raise params.inspect
  end

  def edit
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    @section.set_category(params[:category])
    # raise params.inspect
    if @section.save

      @course.sections << @section
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def update
    if @section.update(section_params)
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    @section.destroy
    redirect_to course_path(@course)
  end

  def all
    @section = Section.find_by(params[:id])
    @course = @section.course if @section
    @sections = Section.all
  end

  private
    def section_params
      params.require(:section).permit(:name, :code, :description, :seats, :period_id, :closed)
    end



end