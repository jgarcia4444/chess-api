# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.
# Rails.application do |config|
  # config.session_store :cookie_store, key: '_interslice_session'
  # config.middleware.use ActionDispatch::Cookies 
  # config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3001"
    resource "*",
      headers: :any,
      expose: %w[access_token expired token-type uid client],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
  
# end
