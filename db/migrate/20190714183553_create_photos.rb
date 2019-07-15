class CreatePhotos < ActiveRecord::Migration[5.2]
  devise_for :users
  root 'places#index'
  resources :places do
      resources :comments, only: :create
      resources :photos
  end
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
