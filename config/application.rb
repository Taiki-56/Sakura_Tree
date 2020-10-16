require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SakuraTree
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0


    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]


    config.i18n.available_locales = %i(ja en)       # アプリケーションが対応している言語のホワイトリスト
    config.i18n.enforce_available_locales = true    # 上の言語以外が指定された場合、エラーにする設定
    config.active_record.default_timezone = :local  # デフォルトのタイムゾーン設定
    config.i18n.default_locale = :ja                # デフォルトの locale(言語)を日本語に


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
