class SongsController < ApplicationController
  def index
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist.nil?
        redirect_to artists_path, alert: "Artist not found"
      else
        if Preference.first.song_sort_order == 'DESC'
          @songs = @artist.songs.sort { |a, b| b.title <=> a.title }
        else
          @songs = @artist.songs.sort { |a, b| a.title <=> b.title }
        end
      end
    else
      if Preference.first.song_sort_order == 'DESC'
        @songs = Song.all.sort { |a, b| b.title <=> a.title }
      else
        @songs = Song.all.sort { |a, b| a.title <=> b.title }
      end
    end
  end

  def show
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id])
      if @song.nil?
        redirect_to artist_songs_path(@artist), alert: "Song not found"
      end
    else
      @song = Song.find(params[:id])
    end
  end

  def new
    if !Preference.first.allow_create_songs
      redirect_to songs_path
    end

    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
