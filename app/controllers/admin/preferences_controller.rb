class Admin::PreferencesController < ApplicationController
  def show
    @preferences = Preference.find_or_create_by(id: 1)
  end

  def update
    raise params.inspect
  end
end
