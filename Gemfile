# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'airbrake'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
end

gem 'activeadmin'
gem 'arctic_admin'
gem 'devise'
