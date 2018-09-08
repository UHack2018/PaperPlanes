Rails.application.routes.draw do
  resources :shared_folders
  resources :folders
  resources :holdings
  devise_for :users
	root "home#index"
	get "holdings/get/:id" => "holdings#get" ,as: "download"
	get "home/share" => "home#share"
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
