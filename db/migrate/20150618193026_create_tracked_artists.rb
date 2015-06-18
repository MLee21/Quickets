class CreateTrackedArtists < ActiveRecord::Migration
  def change
    create_table :tracked_artists do |t|
      t.references :user, index: true, foreign_key: true
      t.references :artist, index: true, foreign_key: true
    end
  end
end
