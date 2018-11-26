class Admin::PreferencesController < ApplicationController
  def show
    @preferences = Preference.find_or_create_by(id: 1)
  end

  def update
    @preferences = Preference.find_or_create_by(id: 1)
    @preferences.update(preference_params)
    redirect_to admin_preference_path(@preferences)
  end

  private
    def preference_params
      params.require(:preference).permit(:artist_sort_order, :song_sort_order, :allow_create_artists, :allow_create_songs)
    end
end
