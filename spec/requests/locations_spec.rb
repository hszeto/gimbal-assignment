RSpec.describe 'Nearby Cafes', type: :request do
  describe 'POST /nearby' do
    let(:gimbal_latlon){{ lat: '34.0342747', lon: '-118.241705' }}
    let(:iamplus_latlon){{ lat: '34.087100', lon:'-118.328810' }}

    context 'when request is valid' do
      it 'returns 5 cafes around Gimbal' do
        post('/api/nearby', params: gimbal_latlon)

        parsed_body = JSON.parse(response.body)
        response_cafe_names = parsed_body['cafes'].map{ |m| m['name'] }
        response_radius = parsed_body['radius']

        expect(response.status).to eq(200)
        expect(response_radius).to eq(0.9501942255108312)
        expect(response_cafe_names)
          .to contain_exactly 'Blue Bottle Coffee','Urth Caffé','Stumptown Coffee Roasters','Verve Coffee - DTLA','L.A. Cafe'
      end

      it 'returns 5 cafes around i.am+' do
        post('/api/nearby', params: iamplus_latlon)

        parsed_body = JSON.parse(response.body)
        response_cafe_names = parsed_body['cafes'].map{ |m| m['name'] }
        response_radius = parsed_body['radius']

        expect(response.status).to eq(200)
        expect(response_radius).to eq(0.9538984757926076)
        expect(response_cafe_names)
          .to contain_exactly 'Cafe Gratitude','Groundwork Coffee Co.','Go Get Em Tiger','Coffee Commissary','M Cafe'
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
