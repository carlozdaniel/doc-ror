class AddAdminUserIdAndVisibilityToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :admin_user_id, :integer
    add_column :photos, :visibility, :integer

    Photo.update_all(admin_user_id: 1)
    Photo.find_each do |photo|
      if photo.id % 2 == 0
        photo.update!(visibility: 0)
      else
        photo.update!(visibility: 1)
      end
    end
  end
end
