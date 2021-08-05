module StripsHelper
  def strip_variant(s, resolution)
    if request.env['HTTP_ACCEPT'] && request.env['HTTP_ACCEPT'].include?('image/webp') 
      rails_representation_url(s.image.variant(resize_to_limit:[resolution,nil], quality: [85], format: :webp))
    else 
      rails_representation_url(s.image.variant(resize_to_limit:[resolution,nil], quality: [100]))
    end
  end
  def split_url(url)
    URI(url).host.split('.')[-2]
  end
end
