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
      it 'blank params return 422' do
        post('/api/nearby', params: {})

        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)['error']).to eq 'missing params'
      end

      it 'missing params return 422' do
        post('/api/nearby', params: {lat: '34.034560'})

        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)['error']).to eq 'missing params'
      end

      it 'params not a float number return 422' do
        post('/api/nearby', params: {lat: '-11', lon: 'abc123'})

        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)['error']).to eq 'invalid params'
      end
    end
  end
end
