Rails.application.configure do

    config.cache_classes = false

    config.eager_load = false

    config.consider_all_requests_local = true

    if Rails.root.join('tmp', 'caching-dev.txt').exist?
      config.action_controller.perform_caching = true
      config.action_controller.enable_fragment_cache_logging = true

      config.cache_store = :memory_store
      config.public_file_server.headers = {
        'Cache-Control' => "public, max-age=#{2.days.to_i}"
      }
    else
      config.action_controller.perform_caching = false

      config.cache_store = :null_store
    end

    config.active_storage.service = :local

    #config.action_mailer.perform_deliveries = true　　　#メール送信を有効にする      これを打つとなぜかrails s が立てられなくなる



    config.action_mailer.raise_delivery_errors = true  #メール送信ができなかった場合、エラーを発生させる
    config.action_mailer.delivery_method = :smtp      #メール送信する際に通信プロトコルSMTPを利用する   ???
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

    config.action_mailer.perform_caching = true   #falseからtrueに変更した

    config.active_support.deprecation = :log

    config.active_record.migration_error = :page_load

    config.active_record.verbose_query_logs = true

    config.assets.debug = true

    config.assets.quiet = true

    config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
