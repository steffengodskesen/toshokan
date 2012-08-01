source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'jquery-rails'
gem 'blacklight'
gem "blacklight_range_limit"
gem 'pg'
gem 'unhappymapper', :require => 'happymapper'
gem 'httparty'
gem 'hashie'
gem 'omniauth'
gem 'omniauth-cas'
gem 'cancan'
gem 'acts-as-taggable-on'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',    '~> 3.2.3'
  gem 'compass-rails', '~> 1.0.0'
  gem "compass-susy-plugin", "~> 0.9.0"
  gem 'coffee-rails',  '~> 3.2.1'

  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'simplecov', :require => false
  gem 'simplecov-html', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
end

group :test, :development do
  gem 'jettywrapper'
  gem 'debugger'
  gem 'rspec-rails'  
end

group :development do
  gem 'brakeman'
  gem 'rails_best_practices'

  gem 'paint'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-brakeman'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'guard-rails_best_practices'
  gem 'highline'
  # eventmachine 0.12.10 does not compile on windows
  gem 'eventmachine', '~> 1.0.0.rc4', :platforms => :mswin
  gem 'ruby_gntp'
end

# Deploy with Capistrano
gem 'capistrano'
gem 'rvm-capistrano'

# To use debugger
# gem 'debugger'
