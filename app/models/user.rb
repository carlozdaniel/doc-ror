class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :photos

  #assign an api key on create
  before_create do |user|
    user.api_key = user.generate_api_key
  end

  #generate an unique api key
  def generate_api_key
    loop do
      token = Devise.friendly_token
      break token unless User.where(api_key: token).first
    end
  end
end
