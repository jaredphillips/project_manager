source 'https://rubygems.org'

ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "4.0.0"

# Moving this to postgres for production
gem "pg"

# Using jquery-turbolinks for proper document ready
gem 'jquery-turbolinks'

# Use sorcery for Authenication
gem "sorcery", "~> 0.8.2"

# Use cocoon for nested forms
gem "cocoon", "~> 1.2.0"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Holy smokes, provides console in better errors. 
gem 'binding_of_caller'

# Using jquery plug-ins like datepicker
gem "jquery-ui-rails", "~> 4.0.4"


# Using carrierwave for uploading of all sorts of junk
gem "carrierwave", "~> 0.9.0"

# Carrierwave needs rmagick for resize and image manip.
gem "rmagick", "~> 2.13.2"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
 gem 'therubyracer', platforms: :ruby

# LESS support for rails
 gem "less-rails", "~> 2.3.3"

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'



group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
	gem 'meta_request'
	gem 'better_errors'
	gem 'pry-rails'
	#Using letter opener to send test emails in the browswer (instead of spamming yourself)
	gem "letter_opener"
	# Use sqlite3 as the database for Active Record
end

group :test do 
	gem 'factory_girl_rails'
	gem 'capybara'
	gem "database_cleaner" # used to "undo" any changes we made to the db during tests
  gem "capybara-webkit", '~> 1.0.0' # Capybara driver needed to handle JS
	# Use sqlite3 as the database for Active Record
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
