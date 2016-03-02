require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TT
  class Application < Rails::Application
    config.cache_classes = true
    config.eager_load = true
    config.allow_concurrency = true

    config.consider_all_requests_local = true
    config.action_controller.perform_caching = false
    config.action_mailer.raise_delivery_errors = false
    config.active_support.deprecation = :log
    #config.active_record.migration_error = :page_load
    config.assets.debug = true

    config.log_level = :debug
    config.active_support.deprecation = :log
    config.log_formatter = ::Logger::Formatter.new

    #config.generators do |g|
    #  g.test_framework :rspec, fixtures: true, views: false
    #  g.factory_girl dir: 'spec/factories'
    #end

    #config.include FactoryGirl::Syntax::Methods    

    config.active_record.raise_in_transactional_callbacks = true
  end
end
