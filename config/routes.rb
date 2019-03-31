Rails.application.routes.draw do
  get '/liveness',  to: 'application#liveness'
  get '/readiness', to: 'application#readiness'

  scope 'api' do
    post 'nearby', to: 'locations#nearby'
  end
end
