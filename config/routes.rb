Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'morimoris#index'
  # get 'index/followings' => 'followings#show'
  get '/reload' => 'morimoris#index'

end
