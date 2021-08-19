class Api::V1::PhotosController < ApplicationController
  include Rails::Pagination
  skip_before_action :verify_authenticity_token
  before_action :set_photo, only: [:show]
  before_action :authenticate!, only: [:create, :update, :destroy]
  include PhotosHelper
  # GET /photos
  # GET /photos.json
  def index
    @photos = get_possible_photos
    paginate json: @photos, per_page: 10
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    if @photo.nil?
      render json: {error: 'foto no encontrada'}, status: :not_found
    else
    render json: @photo
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user = @current_user
    if @photo.save
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    @photo = current_user.photos.find_by_id(params[:id])
    if @photo.nil?
      render json: {error: 'foto no encontrada'}, status: :not_found
    elsif @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    if @photo.nill?
      render json: {error: 'foto no encontrada'}, status: :not_found
    else
      @photo.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @possible_photos = get_possible_photos
      @photo = @possible_photos.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:name, :url, :description, :visibility, :license)
    end
end