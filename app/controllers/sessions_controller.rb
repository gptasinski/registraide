class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to courses_path
    else
      flash[:message] = "Looks like you don't have an account yet. Please sign up to use this site."
      redirect_to new_user_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end