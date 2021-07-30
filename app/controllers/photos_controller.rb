class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to photo_detail_path(@photo), notice: "foto creada correctamente"
    else
      flash[:alert] = 'Ha habido un error al guardar la foto' + @photo.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @photo = Photo.find_by_id(params[:id])
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :url, :description, :license, :visibility)
  end
end
