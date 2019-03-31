RSpec.describe 'Nearby Cafes', type: :request do
  describe 'POST /nearby' do
    let(:gimbal_latlon){{ lat: '34.034560', lon: '-118.227870' }}

    context 'when request is valid' do
      it 'returns 5 cafes' do
        post('/api/nearby', params: gimbal_latlon)

        expect(response.status).to eq(200)
      end
    end

    context 'when request is invalid' do
      it 'return 422'
    end
  end
end
