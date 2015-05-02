class RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to session.delete(:return_to) || root_path
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to login_path
    end
  end

  private

  def user_params
    params[:password_confirmation] ||= params[:password]
    params.permit(:username, :email, :password, :password_confirmation)
  end

end
