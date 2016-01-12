ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)

if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end

require "spec_helper"
require "rspec/rails"
require "capybara/rails"
require "capybara/rspec"
require "wisper/rspec/matchers"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.configure do |config|
  config.match = :prefer_exact
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.disable_monkey_patching!
  config.infer_base_class_for_anonymous_controllers = false
  config.backtrace_exclusion_patterns << /gems/
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods
  config.include Rails.application.routes.url_helpers
  config.include Wisper::RSpec::BroadcastMatcher
  config.include FeatureHelpers, :type => :feature
  config.include EmailHelpers

  Rails.application.default_url_options = Rails.application.config.action_mailer.default_url_options

  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
    mocks.verify_partial_doubles = true
  end
end
