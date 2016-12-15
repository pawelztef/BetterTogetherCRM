source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use mysql the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Bootstrap 3
gem 'bootstrap-sass', '~> 3.3.6'
# Awesome Fonts Sas
gem 'font-awesome-sass', '~> 4.7.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Fixing turbolinks
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Lorem Ipsum helper
gem 'faker'

# material styles
# gem 'bootstrap-material-design-rails'

# geolocation
gem  'geocoder'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


# Custom Flash Messages
gem "gritter", "1.2.0"

# Nicer Validation Messages and form helpers
gem "simple_form"


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'guard-rspec'
  gem "factory_girl_rails"
  gem "capybara"
  gem "rspec-rails"
  gem "shoulda"

  # performance meausre
  gem 'rack-mini-profiler'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  #live browser update
  gem 'guard-livereload', '~> 2.5', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

