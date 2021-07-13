require 'vcr'

VCR.configure do |c|
  c.ignore_localhost = true
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!

  c.filter_sensitive_data('<SHOPIFY_API_SECRET>') {"#{ENV['SHOPIFY_API_SECRET']}"}
  c.filter_sensitive_data('<SHOPIFY_API_LINK>') {"#{ENV['SHOPIFY_API_LINK']}"}
end
