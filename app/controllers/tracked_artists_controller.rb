class TrackedArtistsController < ApplicationController

  def show
    @tracked_artists = Artist.all 
  end

  def create
    artist = Artist.find_or_create_by(name: params[:name])
    if current_user.tracked_artists.find_by(artist_id: artist.id)
      flash[:error] = "You are already tracking this artist"
      redirect_to request.referrer
    else
      TrackedArtist.create(user_id: current_user.id, artist_id: artist.id)
      flash[:success] = "You are now following #{artist.name}"
      redirect_to tracked_artist_path
    end
  end

end