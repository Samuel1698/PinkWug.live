ActiveAdmin.register Strip do

  permit_params :title, :subtext, :image, :transcript, :created_at, :updated_at, strip_tags_attributes: [:id, :title, :strip_id, :tag_id, :_destroy]

  filter :title
  filter :tags
  filter :created_at 
  filter :updated_at


  index download_links: false do |f|

    f.selectable_column
    f.column :image do |strip|
      image_tag url_for(strip.image.variant(resize_to_limit:[200,10000]))
    end
    f.column :title
    f.column :tags
    f.column :created_at
    f.actions
  end
  
  show do 
    attributes_table do 
      row :title
      row :subtext
      row :image do |strip|
        image_tag url_for(strip.image.variant(resize_to_fit:[700,10000]))
      end
      row :transcript
      row :tags do |strip|
        strip.tags.map { |st| st.title }.join(", ").html_safe
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Strip Details" do
      f.input :title
      f.input :subtext, hint: "Short description. Only visible on search results"
      f.input :image, as: :file if !f.object.image.attached?
      f.input :image, hint: "If you change image file, it wont show up here until you click Update Strip!", image_preview: :true if f.object.image.attached?
      f.input :transcript, hint: "Not required. Good for accessibility. Describe every panel of the comic", :input_html => { :rows => 10 }
      # f.input :tags, :input_html => {:multiple => true} do
      #   f.has_many :strip_tags, as: :select, allow_destroy: true do |s|
      #     s.input :tag, :collection => Tag.all.map { |tg| ["#{tg.title.capitalize}", tg.id] }
      #   end
      # end
      f.has_many :strip_tags, allow_destroy: true do |t|
        t.input :tag, hint: "You have to create these separately if none match, match as many as possible. It's good for Search Engine Optimization"
      end
      
     
      # f.has_many :strip_tags, 
      #            new_record: 'Add Tag', 
      #            remove_record: 'Remove', 
      #            allow_destroy: true, new_record: true do |s|
      #   s.input :tag, as: :datalist
      # end
      f.input :created_at, as: :date_picker, label: "Created in"
    end
    f.actions 
  end
  
  controller do 
    def find_resource
      scoped_collection.find(params[:id])
    end
  end
end
