source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.0.2'
# Use Puma as the app server
gem 'puma', '~> 6.6', '>= 6.6.0'
# Use SCSS for stylesheets
gem 'sassc-rails'
# Transpile app-like JavaScript. Read more: https://github.com/shakacode/shakapacker/tree/main
gem 'shakapacker', '~> 7.2.3'
# turbo makes navigating your web application faster. Read more: https://github.com/hotwired/turbo
gem 'turbo-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11', '>= 2.11.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use randumb to select a random strip from database without performance issue
gem 'randumb'
# Use devise for login and user ids
gem 'devise', '~> 4.9', '>= 4.9.0'
# Use FriendlyID for SEO-friendly Slugs
gem 'friendly_id', '~> 5.4.2'
# Use Active Admin for content management
gem 'activeadmin', '~> 3.2.0', '>= 3.2.0'
# Use artic admin to override how aa looks
gem 'arctic_admin', '>= 4.1.0'
# Use meta-tags for SEO
gem 'meta-tags', '>= 2.18.0'
# Resize image attachments
gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Use autoprefixer for browser compatibility
gem "autoprefixer-rails"
# Use rinku to bring back auto_link functionality to rails
gem 'rinku', '~> 2.0', '>= 2.0.6'
# Use aws-sdk-s3 to configure Rails to use Amazon Web Services
gem 'aws-sdk-s3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # use dotenv to store local variables
  gem 'dotenv-rails', '>= 2.8.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.2.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring' No longer needed in Rails 8.0.2
  # gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Use rspect-rails for testing environment
  gem 'rspec-rails', '~> 6.0', '>= 6.0.0'
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