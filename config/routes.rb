Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :bannars
  resources :sites
	root to: "sites#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end