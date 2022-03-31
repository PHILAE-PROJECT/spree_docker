# Lograge config
Rails.application.configure do

  config.lograge.enabled = true
  config.lograge.base_controller_class = 'ActionController::API'

  # This specifies to log in JSON format
  config.lograge.formatter = Lograge::Formatters::Json.new

  ## Disables log coloration
  config.colorize_logging = false

  # Log to a dedicated file
  config.lograge.logger = ActiveSupport::Logger.new(File.join(Rails.root, 'public', "logs.log"))

  # This is useful if you want to log query parameters
  config.lograge.custom_options = lambda do |event|
      { :ddsource => 'ruby',
        :params => event.payload[:params].reject { |k| %w(controller action).include? k },
        :timestamp  => Time.now,
        :remote_ip => event.payload[:request].remote_ip,
        :session_id => event.payload[:request].session.id
      }
  end
end
