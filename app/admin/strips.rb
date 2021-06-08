ActiveAdmin.register Strip do

  permit_params :title, :subtext ,:image, :transcript, :created_at, :updated_at

  filter :title
  filter :created_at 
  filter :updated_at


  index download_links: false do    

    selectable_column
    column :image do |strip|
      image_tag url_for(strip.image.variant(resize_to_limit:[200,200]))
    end
    column :title
    column :updated_at
    actions
  end
  
  show do 
    attributes_table do 
      row :title
      row :subtext
      row :image do |strip|
        image_tag url_for(strip.image.variant(resize_to_fit:[700,700]))
      end
      row :transcript
      row :created_at
      row :updated_at
    end
  end
 
  form do |f|
    f.inputs "Strip Details" do
      f.input :title 
      f.input :subtext, hint: "Not required"
      f.input :image, as: :file if !f.object.image.attached?
      f.input :image, image_preview: :true if f.object.image.attached?
      f.input :transcript, hint: "Not required. Good for accessibility. Describe every panel of the comic"
      f.input :created_at, as: :date_select
    end
    f.actions 
  end
  
  controller do 
    def find_resource
      scoped_collection.find(params[:id])
    end
  end
end
