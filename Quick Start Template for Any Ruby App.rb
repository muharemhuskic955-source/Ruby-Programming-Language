# Gemfile
source 'https://rubygems.org'

gem 'rails', '~> 7.0'
gem 'sqlite3'  # or postgresql/mysql
gem 'bootsnap', require: false
gem 'turbo-rails'
gem 'stimulus-rails'

# For web apps
gem 'sassc-rails'
gem 'jsbundling-rails'

# For APIs
gem 'active_model_serializers'

# For authentication
gem 'devise'

# For file uploads
gem 'image_processing'