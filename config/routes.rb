Rails.application.routes.draw do
	root to: 'users#index',as: :root

  resources :addresses
  resources :users do
    collection do
      get 'search'
    end
  end
  # root to: 'homes#index', as: :root

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
