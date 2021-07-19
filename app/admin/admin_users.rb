ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  filter :email
  filter :created_at

  ActiveAdmin.setup do |config|
    config.localize_format = :long
  end

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  show do 
    attributes_table do 
      row :email 
      row :reset_password_token
      row :reset_password_sent_at 
      row :created_at
      row :updated_at  
    end
  end
  
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
