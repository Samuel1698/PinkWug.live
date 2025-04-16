require 'vcr'

VCR.configure do |c|
  c.ignore_localhost = true
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!

  c.ignore_hosts(
    'storage.googleapis.com',
    'googlechromelabs.github.io',
    'edgedl.me.gvt1.com'
  )
  c.filter_sensitive_data('<SHOPIFY_API_SECRET>') {"#{ENV['SHOPIFY_API_SECRET']}"}
end
