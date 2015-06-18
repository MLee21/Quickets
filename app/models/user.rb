class User < ActiveRecord::Base

  has_many :tracked_artists
  has_many :artists, through: :tracked_artists

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.email     = auth.info.email
    user.image_url = auth.info.image
    user.token     = auth.credentials.token
    user.location  = auth.info.location
    user.save

    user
  end


end