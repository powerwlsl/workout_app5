Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :users do 
    resources :exercises
  end

  root to:"dashboards#index"
  
  resources :dashboards,only: [:index] do 
    collection do 
      post :search, to: "dashboards#search"
    end
  end

  resources :followings
end
