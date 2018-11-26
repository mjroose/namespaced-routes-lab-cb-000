class Preference < ActiveRecord::Base
  def asc_desc
    [ ['ASC', 'Ascending (A-Z)'], ['DESC', 'Descending (Z-A)'] ]
  end

  def yes_no
    [ [true, 'Yes'], [false, 'No'] ]
  end
end
