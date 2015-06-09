class SongsController < ApplicationController
  before_filter :load_playlist

  def index
    @songs = Song.where(playlist_id: @playlist.id)
    @song = Song.new
  end

  def show
    @song = song.find(params[:id])
  end

  def new
    @song = Song.new
    @song.save
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = "Song added"
    else
      flash[:notice] = "Song could not be added"
    end
    redirect_to playlist_songs_path(@playlist, @songs)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = song.find(params[:id])

    if @song.update_attributes(song_params)
      redirect_to playlist_songs_path(@playlist)
    else
      render :edit
    ends
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to playlist_songs_path(@playlist, @songs)
  end


  private
  def song_params
    params.require(:song).permit(
      :title,
      :artist
      )
  end

  def load_playlist
    @playlist = Playlist.find(params[:playlist_id])
  end
end
