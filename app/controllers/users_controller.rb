class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :new_session

  def login
    @user = User.new
  end

  def new_session
    @user = User.find_by_email(user_params[:email])
    if @user.nil?
      redirect_to login_path, notice: 'el usuario no existe'
    elsif @user.valid_password?(user_params[:password])
      sign_in(:user, @user)
      redirect_to :root, notice: 'sesion iniciada correctamente'
    else
      redirect_to login_path, alert: 'contrasena invalid'
    end
  end

  def logout
    sign_out
    redirect_to :root, notice: 'has serrado seccion correctamente'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
