module ApplicationHelper

  def current_user
    current_user ||= User.find(session[:id]) if authenticated?
  end

  def authenticated?
    session[:id] != nil
  end

  def authorize
    unless authenticated?
      redirect_to login_path
    end
  end

  def authorized_to_edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id || current_user.admin
      render 'shared/not_authorized'
    end
  end

  def admin_auth?
    unless current_user.admin == true
      render 'shared/not_authorized'
    end
  end

  def find_course
    @course = Course.find_by(id: params[:course_id])
  end

  def find_section
    @section = Section.find_by(id: params[:id])
  end

end
