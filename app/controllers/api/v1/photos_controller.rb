class Api::V1::PhotosController < ApplicationController
  include Rails::Pagination
  skip_before_action :verify_authenticity_token
  before_action :set_photo, only: [:show, :update, :destroy ]
  before_action :authenticate!, only: [:create, :update, :destroy]
  # GET /photos
  # GET /photos.json
  def index
    @photos = get_possible_photos
    paginate json: @photos, per_page: 10
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    render json: @photo
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @possible_photos = get_possible_photos
      @photo = possible_photos.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:name, :url, :description, :visibility, :license, :user_id)
    end
end
