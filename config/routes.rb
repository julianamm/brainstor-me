Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'users/sessions' }
  resources :projects do
    resources :notes, only: [:create, :destroy] do
      collection do
        patch :sort 
      end
    end
  end

  resources :users, only: [:index]

  resources :shoutouts do
    resources :create_messages
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "projects#index"
end
