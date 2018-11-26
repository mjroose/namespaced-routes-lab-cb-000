class Preference < ActiveRecord::Base
  def asc_desc
    [ ['ASC', 'Ascending (A-Z)'], ['DESC', 'Descending (Z-A)'] ]
  end

  def yes_no
    [{
      text: 'Yes',
      value: true
    },
    {
      text: 'No',
      value: false
    }]
  end
end
