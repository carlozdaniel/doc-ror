class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :license, :visibility
  belongs_to :user, serializer: UserPhotoIndexSerializer
end
