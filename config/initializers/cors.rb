# Be sure to restart your server when you modify this file.
#
# Cross-Origin Resource Sharing (CORS). Tighten `origins` in production via CORS_ORIGINS.

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV.fetch("CORS_ORIGINS", "*").split(",")

    resource "*",
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
