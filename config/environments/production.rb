Rails.application.configure do

  config.cache_classes = true


  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?


  config.assets.compile = false

  config.active_storage.service = :local

  config.log_level = :debug

  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  #config.action_mailer.raise_delivery_errors = true  #メール送信ができなかった場合、エラーを発生させる

  config.action_mailer.perform_deliveries = true　　　#メール送信を有効にする

  config.action_mailer.delivery_method = :smtp       #メール送信する際に通信プロトコルSMTPを利用する   ???

  config.action_mailer.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 587,
    domain:               'smtp.sendgrid.net',
    user_name:            'sg7xrfji@kke.com',
    password:             'hmyktn4241',
    authentication:       :plain,
    enable_starttls_auto: true
  }

  config.action_mailer.default_url_options = { host: 'localhost:3000' }

end
