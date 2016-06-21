Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
  scope: ['email',
  'https://www.googleapis.com/auth/gmail.modify'],
  access_type: 'offline'
  }
end

OmniAuth.config.full_host = Rails.env.production? ? 'http://quickets.herokuapp.com' : 'http://localhost:3000'