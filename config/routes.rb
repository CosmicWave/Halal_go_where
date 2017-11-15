Rails.application.routes.draw do
  devise_for :owners
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	devise_for :foodies, controllers: { registrations: "registrations", omniauth_callbacks: "foodies/omniauth_callbacks"  }
  
	namespace :foodies do
		resources :photos do
      
      resources :likeables, only: [:create, :new, :destroy] do
        
        member do
          get 'convert_like'
        end
        
        member do
          get 'convert_dislike'
        end
      
      end
		end
	end		

  root to: "homes#index"
	
  resources :foodies, only: [:show, :edit, :update]

  resources :restaurants, except: [:index] do
    resources :disapproves, only: [:create, :destroy] do
      delete 'convert', on: :member
    end
    resources :recommends, only: [:create, :destroy] do
      delete 'convert', on: :member
    end
  end
  
  resources :searches, only: [:show, :new, :create]

  resources :tags, only: [:index]
  
  patch 'search_photos', to: 'homes#search_photos'
  get 'homes/simple_search', to: 'homes#simple_search', as: :simple_search
  get 'tags/:tag', to: 'tags#index', as: :tag
  get 'homes/view_more', to: 'homes#view_more', as: :view_more
  get 'homes/top_reviews', to: 'homes#top_reviews', as: :top_reviews
#  get 'homes/contact', to: 'homes#contact', as: :contact
  get 'homes/about_us', to: 'homes#about_us', as: :about_us


  resources :contacts, only: [:new, :create]
end
