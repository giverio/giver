Rails.application.routes.draw do

  root to: "projects#index"

  devise_for  :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, controllers: { registrations: 'users/registrations', invitations: 'users/invitations' }

  resources :orgs do
    resources :links
    member do
      get :projects
      get :location
      get :admin
    end
  end

  resources :projects do
    resources :rewards
    resources :updates
    resources :comments
    resources :messages
    resources :donations do
      collection do
        get :payment
      end
    end
  end

  get 'p/:id' => 'projects#short_link'

  resources :users do
    member do
      get  :donations
      get  :creditcard
      post :update_creditcard
    end
  end

  require 'sidekiq/web'
  mount Sidekiq::Web,   at: '/sidekiq'
  mount Bootsy::Engine, at: '/bootsy', as: 'bootsy'

end
