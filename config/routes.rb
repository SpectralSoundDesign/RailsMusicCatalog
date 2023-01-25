Rails.application.routes.draw do
  resources :entries do
    collection do
      post :import
    end
  end
end
