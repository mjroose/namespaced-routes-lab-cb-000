class Admin::PreferencesController < ApplicationController
  def index
    @preference = Preference.find_or_create(1)
  end
end
