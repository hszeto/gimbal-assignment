RSpec.describe Cafe, type: :model do
  describe 'coordinate' do
    it 'return coordinate array' do
      cafe_lat = Cafe.last.lat
      cafe_lon = Cafe.last.lon

      expect(Cafe.last.coordinate).to eq [cafe_lat, cafe_lon]
    end
  end
end
