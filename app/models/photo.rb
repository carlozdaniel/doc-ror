class Photo < ApplicationRecord
  enum license: [:copyright, :copyleft, :creative_commons]

  validates :name, :url, presence: true
  validates :license, inclusion: { in: Photo.licenses }
end
