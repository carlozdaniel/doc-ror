class Photo < ApplicationRecord
  enum license: [:copyright, :copyleft, :creative_commons]
end
