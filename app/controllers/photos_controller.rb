class PhotosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :new_session
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  include PhotosHelper
  def index
    @photos = get_possible_photos
  end

  def new
    @photo = Photo.new
  end

def my_photos
  @photos = current_user.photos
end

  def create
    @photo = Photo.create(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to photo_path(@photo), notice: "foto creada correctamente"
    else
      flash[:alert] = 'Ha habido un error al guardar la foto' + @photo.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @possible_photos = get_possible_photos

    @photo = @possible_photos.find_by_id(params[:id])
    if @photo.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found
    else
      render :show
    end
  end

  def edit
    @photo = current_user.photos.find_by_id(params[:id])
    if @photo.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found
    else
      render :edit
    end
  end

  def update
    @photo = current_user.photos.find_by_id(params[:id])
    if @photo.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found
    elsif @photo.update(photo_params)
      flash[:notice] = 'la foto  se ha actualizado correctamente'
      redirect_to photo_path(@photo)
    else
      flash[:alert] = 'ha havido un error al guardar la foto #{@photo.name}'
      render :edit
    end
  end

  def destroy
    @photo = current_user.photos.find_by_id(params[:id])
    @photo.destroy
    flash[:notice] = 'la foto '+@photo.name+'se elimino correctamente'
    redirect_to :my_photos

  end


  private
  def photo_params
    params.require(:photo).permit(:name, :url, :description, :license, :visibility)
  end
end
