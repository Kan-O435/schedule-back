source "https://rubygems.org"

ruby "3.2.3"

gem "rails", "~> 7.1.5", ">= 7.1.5.1"

# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"git

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
 gem "bcrypt", "~> 3.1.7"

# Windows用のタイムゾーンデータ
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem 'rack-cors'
gem 'rswag-api'
gem 'rswag-ui'
gem 'rswag-specs'
gem 'pg'


group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :development, :test do
  gem 'rspec-rails'
end

gem "bootsnap", "~> 1.18"
