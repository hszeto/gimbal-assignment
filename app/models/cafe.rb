class Cafe < ApplicationRecord
  def latlon
    [self.lat, self.lon]
  end
end
