class Admin::PreferencesController < ApplicationController
  def index
    @preferences = Preference.find_or_create_by(id: 1)
  end
end
