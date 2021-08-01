source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.7'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use randumb to select a random strip from database without performance issue
gem 'randumb'
# Use devise for login and user ids
gem 'devise', '~> 4.8'
# Use FriendlyID for SEO-friendly Slugs
gem 'friendly_id', '~> 5.4.0'
# Use Active Admin for content management
gem 'activeadmin', '~> 2.2'
# Use artic admin to override how aa looks
gem 'arctic_admin'
# Use meta-tags for SEO
gem 'meta-tags'
# Resize image attachments
gem 'image_processing', '~> 1.2'
# Use vips instead of minimagick for processing variants
gem "ruby-vips"
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Use autoprefixer for browser compatibility
gem "autoprefixer-rails"
# Use rinku to bring back auto_link functionality to rails
gem 'rinku', '~> 2.0', '>= 2.0.6'
# Use newrelic for statistics about page response time
gem 'newrelic_rpm'
# Use aws-sdk-s3 to configure Rails to use Amazon Web Services
gem 'aws-sdk-s3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # use dotenv to store Shopify API tokens
  gem 'dotenv-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Use rspect-rails for testing environment
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  # use selenium webdriver
  gem 'selenium-webdriver'
  # Use database_cleaner to wipe and rebuild the test database between the test runs
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # Use webmock for stubbing and setting HTTP request expectations
  gem "webmock"
  # Use VCR to get API call during test
  gem "vcr"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Use postgresql
gem 'pg'