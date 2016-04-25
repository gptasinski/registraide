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
    unless current_user.id == @user.id
      flash[:message] = "So sorry, you don't have authorization for that."
      redirect_to user_path(current_user)
    end
  end

  def authorized_to_register

  end

end
