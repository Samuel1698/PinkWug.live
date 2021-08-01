module StripsHelper
  def strip_variant(s, resolution)
    result   = s.image
    url_for(result.variant(resize_to_limit:[resolution,nil], quality:[85]).processed)
  end
  def split_url(url)
    URI(url).host.split('.')[-2]
  end
end
