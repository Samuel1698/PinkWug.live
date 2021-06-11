class FileInput < Formtastic::Inputs::FileInput

  include Rails.application.routes.url_helpers

  def to_html
    input_wrapping do
      label_html <<
        builder.file_field(method, input_html_options) <<
        image_preview_content
    end
  end

  private

  def image_preview_content
    image_preview? ? image_preview_html : ""
  end

  def image_preview?
    options[:image_preview] && @object.send(method).present?
  end

  def image_preview_html
    template.image_tag(rails_blob_path(@object.send(method), disposition: "attachment", only_path: true), width: "600", :class => "image-preview")
  end
end