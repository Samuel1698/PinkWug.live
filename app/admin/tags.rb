ActiveAdmin.register Tag do

  permit_params :title
  
  filter :title

  index do
    selectable_column
    column :id
    column :title
    actions
  end
end
