ActiveAdmin.register Strip do

  permit_params :title, :description, :image, :keywords, :transcript, :created_at, :updated_at, :comment

  filter :title
  filter :description
  filter :transcript
  filter :created_at

  ActiveAdmin.setup do |config|
    config.localize_format = :short
  end

  # Sort order for index
  config.sort_order = 'created_at_desc'

  index download_links: false do |f|
    f.selectable_column 
    f.column :image do |strip|
        image_tag url_for(strip.image), width: "200px"
      end
    f.column :title
    f.column :created_at
    f.actions
  end
  
  show do 
    attributes_table do 
      row :title
      row :description unless strip.description.blank?
      row :keywords
      row :comment unless strip.comment.blank?
      row :image do |strip|
        image_tag url_for(strip.image), width: "700px"
      end
      row :transcript unless strip.transcript.blank?
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Comic Details" do
      f.input :title
      f.input :description, hint: "Short description. Only visible on search results & link embeds"
      f.input :keywords_raw, as: :string, label: "Tags", hint: "What is this comic about? Less than 20 words", placeholder: "Example: General Strike, Capitalism, Unions, Amazon", required: true
      f.input :comment, label: "Author Comment", hint: "Relevant Links/Announcements. Press Enter once for a line break, twice for a new paragraph.", :input_html => { :rows => 2 }
      span "Image*", id: "image-label"
      div id: "drop-region" do
        f.input :image, as: :file
        div "Drag & Drop Image or click to upload", class: "drop-message"
        div id: "image-preview" do
          img class: "image-element" unless strip.image.attached?
          img src: url_for(strip.image), class: "image-element edit" if strip.image.attached?
          div class: "overlay" 
        end
      end
      f.input :transcript, hint: "Important for accessibility. Describe every pannel of the comic.", :input_html => { :rows => 5 }
      a "Click Here to Read More", href: "https://supercooldesign.co.uk/blog/how-to-write-good-alt-text", target: "_blank", class: "transcript_link"
      f.input :created_at, as: :date_picker, label: "Created In", hint: "If blank will default to Today", date_picker_options: { max_time: "+0D" }
    end
    f.actions 
  end

  before_save do |strip|
    strip.keywords_raw = params[:strip][:keywords_raw].split(", ") unless params[:strip].nil? or params[:strip][:keywords_raw].nil?
    hour   = Time.new().strftime('%H').to_i * 3600
    minute = Time.new().strftime('%M').to_i * 60
    second = Time.new().strftime('%S').to_i
    strip.created_at = strip.created_at + hour + minute + second unless strip.created_at.nil?
    strip.created_at = Time.new() if strip.created_at.nil?
  end
  controller do 
    def find_resource
      scoped_collection.find(params[:id])
    end
  end
end