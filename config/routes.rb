Rails.application.routes.draw do
  devise_for :foodies, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "homes#index"



end
