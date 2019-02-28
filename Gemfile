source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails_12factor'
gem 'uglifier'
gem 'rails', '~> 5.2.2'
gem 'jquery-rails'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end
