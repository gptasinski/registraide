class SectionsController < ApplicationController

  def edit
    @course = Course.find_by(id: params[:course_id])
    @section = Section.find_by(id: params[:id])
  end

  def new
    @course = Course.find_by(id: params[:course_id])
    @section = Section.new
  end

  def create
    @course = Course.find_by(id: params[:course_id])
    @section = Section.new(section_params)
    if @section.save
      @course.sections << @section
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def update
    @course = Course.find_by(id: params[:course_id])
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find_by(id: params[:course_id])
    @section = Section.find_by(id: params[:id])
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