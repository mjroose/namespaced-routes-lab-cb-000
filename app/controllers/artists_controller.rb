class ArtistsController < ApplicationController
  def index
    artist_sort_order = Preference.first.nil? ? 'ASC' : Preference.first.artist_sort_order

    if artist_sort_order == 'DESC'
      @artists = Artist.all.sort { |a, b| b.name <=> a.name }
    else
      @artists = Artist.all.sort { |a, b| a.name <=> b.name }
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    allow_create_artists = Preference.first.nil? ? true : Preference.first.allow_create_artists
    binding.pry
    if !allow_create_artists
      redirect_to artists_path
    end

    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
