class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      login @user
      redirect_to session.delete(:return_to) || root_path
    else
      flash[:error] = "Your username/password combination is incorrect."
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to session.delete(:return_to) || root_path
  end
end
