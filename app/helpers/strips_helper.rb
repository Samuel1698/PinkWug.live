module StripsHelper
  def strip_variant(s, resolution)
    url_for(s.image.variant(resize_to_limit:[resolution,nil], compress: 'none', quality:[100]))
  end
end
