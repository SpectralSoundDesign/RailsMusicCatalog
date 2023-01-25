Rails.application.routes.draw do
  root to:"entries#index"

  resources :entries do
    collection do
      post :import
    end
  end
end
