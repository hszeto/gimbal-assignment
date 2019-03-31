module Distance
  class Calculator
    attr_reader :current_coordinate

    def initialize(current_coordinate)
      @current_coordinate = current_coordinate
    end

    def closest_five
      cafes = Cafe.all.map do |c|
        {
          name: c.name,
          lat: c.lat,
          lon: c.lon,
          distance: distance_from(c.coordinate)
        }
      end

      results = cafes.sort_by{ |c| c[:distance] }[0..4]

      save_csv_for results

      results
    end

    private

    def save_csv_for results
      CSV.open("tmp/results.csv", "wb",
        :write_headers => true,
        :headers => ['lat', 'lng', 'name']
      ) do |csv|
        results.each do |c|
          csv << c.values_at(:lat, :lon, :name)
        end
      end
    end

    # Haversine formula from https://stackoverflow.com/a/12969617
    def distance_from cafe_coordinate
      rad_per_deg = Math::PI/180  # PI / 180
      rmi = 3958.8                # Earth radius in miles

      dlat_rad = (cafe_coordinate[0]-current_coordinate[0]) * rad_per_deg  # Delta, converted to rad
      dlon_rad = (cafe_coordinate[1]-current_coordinate[1]) * rad_per_deg

      lat1_rad, lon1_rad = current_coordinate.map {|i| i * rad_per_deg }
      lat2_rad, lon2_rad = cafe_coordinate.map {|i| i * rad_per_deg }

      a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
      c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

      rmi * c # Delta in miles
    end
  end
end
