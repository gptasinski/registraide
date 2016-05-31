class SectionsController < ApplicationController
  include ApplicationHelper
  before_action :admin_auth?, except: [:all]
  before_action :find_course, except: [:all]
  before_action :find_section, only: [:edit, :update, :show, :destroy]


  def show
    @section = Section.find_by(id: params[:id])
    @students = @section.students
  end

  def edit
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    @section.set_category(params[:category])
    if @section.save
      @course.sections << @section
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def update
    @section.set_category(params[:category]) if params[:category]
    if @section.update(section_params)
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    @section.destroy
    redirect_to sections_all_path
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