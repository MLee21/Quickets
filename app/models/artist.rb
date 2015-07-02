class Artist < ActiveRecord::Base
  has_many :tracked_artists, dependent: :destroy
  has_many :users, through: :tracked_artists
end