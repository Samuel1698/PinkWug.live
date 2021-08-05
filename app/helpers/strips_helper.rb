module StripsHelper
  def strip_variant(s, resolution)
    if Rails.env.production?
      if request.env['HTTP_ACCEPT'] && request.env['HTTP_ACCEPT'].include?('image/webp') 
        cdn_image_url(s.image.variant(resize_to_limit:[resolution,nil], quality: [85], format: :webp))
      else 
        cdn_image_url(s.image.variant(resize_to_limit:[resolution,nil], quality: [100]))
      end
    else
      url_for(s.image.variant(resize_to_limit:[resolution,nil], quality: [85], format: :webp))
    end
  end
  def split_url(url)
    URI(url).host.split('.')[-2]
  end
end
