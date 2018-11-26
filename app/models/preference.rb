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
end
