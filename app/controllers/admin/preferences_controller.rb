class Admin::PreferencesController < ApplicationController
  def show
    @preferences = Preference.find_or_create_by(id: 1)
  end

  def update
    binding.pry
  end

  private
    def preference_params
      params.require(:preference).permit(:artist_sort_order, :song_sort_order, :allow_create_artists, :allow_create_songs)
    end
end
