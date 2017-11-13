Rails.application.routes.draw do
  
  mount WeixinRailsMiddleware::Engine, at: "/"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :diymenus do
    collection do
        post 'sync'
      end
  end
  resources :bottom_menus
  resources :bannars do
     member do
        post 'down'
        post 'up'
      end
  end
  resources :users, :path => "managers"
  resources :sites
  resources :wx_users
  resources :categories
  resources :articles
	root to: "sites#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :bannars, only: [:index]
      resources :sites
      resources :bottom_menus
    end
  end
end