ActiveAdmin.register Photo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :url, :license, :description, :admin_user, :visibility

  index do
     selectable_column
     id_column
     column :name
     column :description
     column :url
     column 'Propietario', :admin_user_id
     column :license
     column :visibility
     actions
  end



  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :url, :description, :license]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
