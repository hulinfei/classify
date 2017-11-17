Rails.application.routes.draw do

  resources :photos
  mount WeixinRailsMiddleware::Engine, at: "/"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :diymenus do
    collection do
        post 'sync'
      end
  end
  resources :bottom_menus do
    member do
        post 'down'
        post 'up'
      end
  end
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
  resources :info_classes
  resources :info_types
  resources :infos do
    member do
        put 'top'
        put 'off_top'
      end
  end
  resources :counts
	root to: "bannars#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :bannars, only: [:index]
      resources :sites, only: [:index]
      resources :bottom_menus, only: [:index]
      resources :categories, only: [:index]
      resources :wx_users, only: [:index]
      resources :infos
    end
  end
end