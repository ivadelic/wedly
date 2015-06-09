class PlaylistsController < ApplicationController
 before_filter :load_wedding

  def index
    @playlists = Playlist.where(wedding_id: @wedding.id)
    @playlist = Playlist.new
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
    @playlist.save
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      flash[:notice] = "playlist added"
    else
      flash[:notice] = "playlist couldn't be added"
    end
    redirect_to wedding_playlists_path(@wedding, @playlists)
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])

    if @playlist.update_attributes(playlist_params)
      redirect_to wedding_playlists_path(@wedding)
    else
      render :edit
    ends
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to wedding_playlists_path(@wedding, @playlists)
  end


  private
  def playlist_params
    params.require(:playlist).permit(
      :votes,
      :wedding_id,
      :song_id
      )
  end

  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
