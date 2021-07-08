xml.instruct! :xml, version: '1.0'
xml.tag! 'sitemapindex', 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.tag! 'url' do
    xml.tag! 'loc', root_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', about_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', strips_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', store_index_url
  end

  @strips.each do |strip|
    xml.tag! 'url' do
      xml.tag! 'loc', strip_url(strip)
      xml.lastmod strip.updated_at.strftime("%F")
    end
  end
end