Rails.application.routes.draw do
  devise_for :users
  root to: 'main#home'

  resources :entries do
    collection do
      post :import
    end
  end
end
