Rails.application.routes.draw do
  resources :diymenus do
    collection do
        post 'sync'
      end
  end
  resources :bottom_menus
  mount WeixinRailsMiddleware::Engine, at: "/"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :bannars
  resources :users, :path => "managers"
  resources :sites
  resources :wx_users
  resources :categories
  resources :articles
	root to: "sites#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end