Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	devise_for :foodies, controllers: { registrations: "registrations", omniauth_callbacks: "foodies/omniauth_callbacks"  }
  
	namespace :foodies do
		resources :photos do
			
		end
	end		

  root to: "homes#index"
	
  resources :foodies, only: [:show, :edit, :update]

  patch 'search_foods', to: 'homes#search_foods'

  resources :restaurants, except: [:index] do
    resources :disapproves, only: [:create, :destroy] do
      delete 'convert', on: :member
    end
    resources :recommends, only: [:create, :destroy] do
      delete 'convert', on: :member
    end
  end
  

end
