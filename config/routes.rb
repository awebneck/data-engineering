Rails.application.routes.draw do
  resource :open_id_request, only: :create, controller: :open_id_request
  resources :data, only: [:new, :create]

  get '/login' => 'user_session#new', as: 'login'
  post '/login' => 'user_session#create'
  delete '/logout' => 'user_session#destroy', as: 'logout'

  root to: 'data#new'
end
