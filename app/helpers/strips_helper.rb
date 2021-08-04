module StripsHelper
  def strip_variant(s, resolution)
    if request.env['HTTP_ACCEPT'] && request.env['HTTP_ACCEPT'].include?('image/webp') 
      url_for(s.image.variant(resize_to_limit:[resolution,nil], quality: [85], format: :webp).processed).sub(/\?.*/, '')
    else 
      url_for(s.image.variant(resize_to_limit:[resolution,nil], quality: [100]).processed).sub(/\?.*/, '')
    end
  end
  def split_url(url)
    URI(url).host.split('.')[-2]
  end
end
