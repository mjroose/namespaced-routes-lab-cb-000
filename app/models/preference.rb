class Preference < ActiveRecord::Base
  def asc_desc
    [{
      text: 'A-Z',
      value: 'ASC'
    },
    {
      text: 'Z-A',
      value: 'A-Z'
    }]
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
