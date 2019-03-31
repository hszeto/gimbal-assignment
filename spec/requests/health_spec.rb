RSpec.describe 'Application', type: :request do
  describe 'Liveness and Readiness' do
    it 'System is alive' do
      get '/liveness'

      expect(response.status).to eq(204)
    end

    it 'System is ready' do
      get '/readiness'

      expect(response.status).to eq(204)
    end

    context 'When database is not ready' do
      before do
        allow( ActiveRecord::Base )
          .to receive_message_chain("connection")
          .and_return(false)
      end

      it 'return 500' do
        get '/readiness'

        expect( response.status ).to eq 500
      end
    end
  end
end
