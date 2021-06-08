ActiveAdmin.register Strip do

  permit_params :title, :subtext ,:image, :transcript

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
  
  
  # show do 
  #   h2 strip.title
  #   h3 strip.subtext
  #   a image_tag(rails_blob_path(strip.image, disposition: "image", only_path: true), size: "600x600")
  #   h4 strip.transcript
  # end


  form do |f|
    f.inputs "Strip Details" do
      f.input :title 
      f.input :subtext, hint: "Not required"
      f.input :image, as: :file if !f.object.image.attached?
      f.input :image, image_preview: :true if f.object.image.attached?
      f.input :transcript, hint: "Not required. Good for accessibility. Describe every panel of the comic"
    end
    f.actions 
  end
  
  controller do 
    def find_resource
      scoped_collection.find(params[:id])
    end
  end
end
