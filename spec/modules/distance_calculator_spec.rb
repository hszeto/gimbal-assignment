RSpec.describe Distance::Calculator do
  describe 'distance_from' do
    let(:gimbal_coords){ [34.0342747, -118.241705] }
    let(:go_get_em_tiger_coords){ [34.0755676, -118.3234831] }
    let(:vees_cafe_coords){ [34.0323431, -118.3612356] }

    before do
      @calculator = Distance::Calculator.new(gimbal_coords)
    end

    it 'Gimbal to Go Gem em Tiger is 5.48 miles' do 
      expect(
        @calculator
          .send(:distance_from, go_get_em_tiger_coords)
          .round(2)
      ).to eq 5.48
      # 5.48 mile calculated from https://gps-coordinates.org/distance-between-coordinates.php
    end

    it 'Gimbal to Vees Cafe is 6.85 miles' do 
      expect(
        @calculator
          .send(:distance_from, vees_cafe_coords)
          .round(2)
      ).to eq 6.85
       # 6.85 mile calculated from https://gps-coordinates.org/distance-between-coordinates.php
    end
  end
end
