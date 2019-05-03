require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ava
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = 'pt-BR'
    config.i18n.fallbacks = ['pt-BR']
    config.active_record.default_timezone = :local

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.action_mailer.default_url_options = { host: 'agile.centro.iff.edu.br' }
    config.action_mailer.smtp_settings = {
      :address => "mail.iff.edu.br",
      :port => 587,
      :domain => "iff.edu.br",
      :authentication => :login,
      :user_name => "noreply@iff.edu.br",
      :password => "IFFN0R3ply!",
      :enable_starttls_auto => true,
      :openssl_verify_mode  => 'none'
      }
  end
end
