Rails.application.routes.draw do
  get '/convert', to: 'temperature#convert'
end
