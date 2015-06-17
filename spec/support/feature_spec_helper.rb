module FeatureSpecHelper

  def mock_auth_hash
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      "provider" => "google_oauth2",
      "uid" => "12345",
      "info" => {
        "email" => "dinosaursrule@hotmail.com",
        "image_url" => "image.jpg",
        "location" => "Denver",
        },
        "credentials" => {
          "token" => "12345"
        }
      })
  end
end

