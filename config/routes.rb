Rails.application.routes.draw do
  devise_for :users
  #root 'places#index'
  resources :places do
    post '/places/:place_id/photos(.:format)', to: 'photos#show', as: :place_photo_path
    resources :comments, only: :create
    resources :photo do 

    end
    end
    end

