# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.1'
gem 'rails', '~> 6.1.1'

gem 'aasm'
gem 'annotate'
gem 'jbuilder', '~> 2.10'
gem 'octokit'
gem 'omniauth-github'
gem 'pundit'
gem 'webpacker', '~> 5.2'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'rubycritic', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
end
