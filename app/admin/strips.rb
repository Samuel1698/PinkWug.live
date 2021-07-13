ActiveAdmin.register Strip do

  permit_params :title, :description, :image, :keywords, :transcript, :created_at, :updated_at, :comment

  filter :title
  filter :description
  filter :transcript
  filter :created_at

  ActiveAdmin.setup do |config|
    config.localize_format = :long
  end

  # Sort order for index
  config.sort_order = 'created_at_desc'

  index download_links: false do |f|
    f.selectable_column 
    f.column :image do |strip|
        image_tag url_for(strip.image.variant(resize_to_limit:[200,10000]))
      end
    f.column :title
    f.column :created_at
    f.column :updated_at
    f.actions
  end
  
  show do 
    attributes_table do 
      row :title
      row :description unless strip.description.blank?
      row :keywords
      row :comment unless strip.comment.blank?
      row :image do |strip|
        image_tag url_for(strip.image.variant(resize_to_fit:[700,10000]))
      end
      row :transcript unless strip.transcript.blank?
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Comic Details" do
      f.input :title
      f.input :description, placeholder: "Short description. Only visible on search results"
      f.input :keywords_raw, as: :string, label: "Keywords", hint: "What search terms would bring this comic? Don't repeat title", placeholder: "Example: General Strike, Capitalism, Unions, Amazon", required: true
      f.input :comment, label: "Author Comment", hint: "Relevant Links/Announcements. Press Enter once for a line break, twice for a new paragraph.", :input_html => { :rows => 2 }
      f.input :image, as: :file if !f.object.image.attached?
      f.input :image, hint: "If you change image file, it wont show up here until you click Update!", image_preview: :true if f.object.image.attached?
      f.input :transcript, hint: "Not required. Good for accessibility and searchability.", :input_html => { :rows => 5 }
      f.input :created_at, as: :date_picker, label: "Created in"
    end
    f.actions 
  end

  before_save do |strip|
    strip.keywords_raw = params[:strip][:keywords_raw].split(", ") unless params[:strip].nil? or params[:strip][:keywords_raw].nil?
  end
  controller do 
    def find_resource
      scoped_collection.find(params[:id])
    end
  end
end