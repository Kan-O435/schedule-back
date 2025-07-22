# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

# Require support files (e.g., FactoryBot, Devise helpers, etc.)
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Run any pending migrations before tests are run
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Include FactoryBot methods like `create`, `build`, etc.
  config.include FactoryBot::Syntax::Methods

  # Enable fixtures if needed
  config.fixture_paths = [Rails.root.join('spec/fixtures')]

  # Use transactional fixtures (recommended with ActiveRecord)
  config.use_transactional_fixtures = true

  # Infer test type from file location (e.g., type: :model, :request)
  config.infer_spec_type_from_file_location!

  # Filter Rails gems in backtraces
  config.filter_rails_from_backtrace!
  # You can also filter arbitrary gems
  # config.filter_gems_from_backtrace("gem name")
end
