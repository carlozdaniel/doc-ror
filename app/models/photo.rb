class Photo < ApplicationRecord
  enum license: [:copyright, :copyleft, :creative_commons]
  enum visibility: [:pub, :pri]

  validates :name, :url, :user_id, presence: true
  validates :license, inclusion: { in: Photo.licenses }
  validates :visibility, inclusion: { in: Photo.visibilities }
  validates_with PhotoValidator
  belongs_to :user

end
