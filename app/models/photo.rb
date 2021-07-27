class Photo < ApplicationRecord
  enum license: [:copyright, :copyleft, :creative_commons]
  enum visibility: [:pub, :pri]

  validates :name, :url, :admin_user_id, presence: true
  validates :license, inclusion: { in: Photo.licenses }
  validates :visibility, inclusion: { in: Photo.visibilities }

  belongs_to :admin_user

end
