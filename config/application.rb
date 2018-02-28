require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FourOnTheFloor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += Dir["#{Rails.root}/lib"] + Dir["#{Rails.root}/app"]

    config.eager_load_paths = []

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        # Allow developing locally natively or locally on docker
        origins(/\Ahttp:\/\/localhost:\d+\z/, /\Ahttp:\/\/192\.168\.\d{1,3}\.\d{1,3}:\d+\z/)
        resource '*', headers: :any, methods: :any
      end
    end
  end
end
