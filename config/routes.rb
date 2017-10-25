Rails.application.routes.draw do
  devise_for :foodies, :controllers => { :omniauth_callbacks => "foodies/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "homes#index"



	namespace :foodies do
		resources :photos do
			resources :likes do
				delete 'invalid', on: :member
			end

			resources :dislikes do
				delete 'invalid', on: :member
			end
		end
	end		

end
