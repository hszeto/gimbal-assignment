class Cafe < ApplicationRecord
  def coordinate
    [lat, lon]
  end
end
