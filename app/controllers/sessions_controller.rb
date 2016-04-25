class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end