module StripsHelper
  def strip_variant(s, resolution)
    if Rails.env.production?
      if request.env['HTTP_ACCEPT'] && request.env['HTTP_ACCEPT'].include?('image/webp') 
        "https://#{ENV['S3_BUCKET_NAME']}/" + s.image.variant(resize_to_limit:[resolution,nil], quality: [85], format: :webp).key
      else 
        "https://#{ENV['S3_BUCKET_NAME']}/" + s.image.variant(resize_to_limit:[resolution,nil], quality: [100]).key
      end
    else
      rails_representation_url(s.image.variant(resize_to_limit:[resolution,nil], quality: [85], format: :webp))
    end
  end
  def split_url(url)
    URI(url).host.split('.')[-2]
  end
end
