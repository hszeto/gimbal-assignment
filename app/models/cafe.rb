class Cafe < ApplicationRecord
  def coordinate
    [self.lat, self.lon]
  end
end
