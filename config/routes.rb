Rails.application.routes.draw do
  root to: redirect('entries')

  resources :entries do
    collection do
      post :import
    end
  end
end
