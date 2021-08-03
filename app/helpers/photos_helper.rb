module PhotosHelper

  def get_possible_photos
    if current_user
      @possible_photos = Photo.where(user: current_user).or(Photo.where(visibility: :pub))
    else
      @possible_photos = Photo.where(visibility: :pub)
    end
    return @possible_photos
  end
end
