class RenameAdminUserIdByUserIdToPhotoModel < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :admin_user_id, :user_id
  end
end
