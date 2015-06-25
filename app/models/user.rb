class User < ActiveRecord::Base

  has_many :tracked_artists, dependent: :destroy
  has_many :artists, through: :tracked_artists

  def self.find_or_create_from_auth(auth) 
    User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email     = auth.info.email
      user.image_url = auth.info.image
      user.token     = auth.credentials.token
      user.location  = auth.info.location
      user.save
    end
  end


end