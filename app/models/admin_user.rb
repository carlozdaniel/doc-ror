class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  after_create { |admin| admin.send_reset_password_instruccion }

  def password_required
    new_record? ? false : super
  end
end
