source "https://rubygems.org"

ruby "3.3.0"
gem "rails", "~> 7.1.2"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem 'importmap-rails'
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "cssbundling-rails"
gem 'dartsass-rails', '~> 0.5.0'
gem 'jquery-rails'
gem 'popper_js', '~> 2.11.8'
gem 'sassc-rails'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :production do
  gem 'pg'
end
