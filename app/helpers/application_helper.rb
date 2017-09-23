# frozen_string_literal: true

# Here we have all of the basic helper functions
module ApplicationHelper
  def timed_greeting
    case Time.now.hour
    when 0..6 then 'Buenas madrugadas'
    when 7..11 then 'Buenos días'
    when 12..19 then 'Buenas tardes'
    else 'Buenas noches'
    end
  end
end
