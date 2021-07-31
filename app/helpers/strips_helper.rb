module StripsHelper
  def strip_variant(s, resolution)
    url_for(s.image.variant(resize_to_limit:[resolution,nil], quality:[85]))
  end
  def split_url(url)
    URI(url).host.split('.')[-2]
  end
end
