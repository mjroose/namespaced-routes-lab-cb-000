class Preference < ActiveRecord::Base
  def asc_desc
    [ { 'A-Z' => 'ASC' }, { 'Z-A' => 'DESC' } ]
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
