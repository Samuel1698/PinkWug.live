ActiveAdmin.register Strip do

  permit_params :title, :subtext ,:image, :transcript

  filter :title
  filter :created_at 
  filter :updated_at


  index do 
    selectable_column
    column :image do |strip|
      image_tag url_for(strip.image.variant(resize_to_limit:[100,100]))
    end
    column :title
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Strip Details" do
        f.input :title 
        f.input :subtext, hint: "Not required"
        f.input :image, as: :file 
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
