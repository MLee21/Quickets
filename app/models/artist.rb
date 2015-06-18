class Artist < ActiveRecord::Base
  has_many :tracked_artists
  has_many :users, through: :tracked_artists
end