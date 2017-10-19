Rails.application.routes.draw do
  devise_for :foodies, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "home#index"

	resources :foodies, only: [:show, :edit, :update]

end
