class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user,  only: [:update, :show, :destroy]
  before_action :authenticate!, except: [:create]
  # def index
  #   @users = User.all
  #   render json: @users
  # end

  def create
    @user = User.create(user_params)
    if @user.save
    render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    if @user
      render json: @user
    else
      render json: {errors: 'usuario no encontrado'}, status: :not_found
    end
  end

  def update
    if @user
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
      else
        render json: {errors: 'usuario no encontrado'}, status: :not_found
    end
  end

  def destroy
    if @user
      @user.destroy
      render json: { result: 'user eliminado correctamente' }, status: :no_content
    else
      render json: {errors: 'usuario no encontrado'}, status: :not_found
    end
  end

  private
  def set_user
    @user = User.find_by_id(params[:id])
      if @user != @current_user
        @user = nil
      end
  end
  def user_params
    params.require(:user).permit(:id, :name, :email, :password)
  end
end
