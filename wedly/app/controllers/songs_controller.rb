class SongsController < ApplicationController
  before_filter :load_wedding

  def index
    @songs = song.where(wedding_id: @wedding.id)
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
      flash[:notice] = "Song couldn't be added"
    end
    redirect_to wedding_songs_path(@wedding, @songs)
  end

  def edit
    @song = song.find(params[:id])
  end

  def update
    @song = song.find(params[:id])

    if @song.update_attributes(song_params)
      redirect_to wedding_songs_path(@wedding)
    else
      render :edit
    ends
    end
  end

  def destroy
    @song = song.find(params[:id])
    @song.destroy
    redirect_to wedding_songs_path(@wedding, @songs)
  end


  private
  def song_params
    params.require(:song).permit(
      :title,
      :artist
      )
  end

  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
