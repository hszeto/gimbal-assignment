Rails.application.routes.draw do
  get '/liveness',  to: 'application#liveness'
  get '/readiness', to: 'application#readiness'
end
