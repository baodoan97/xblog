Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, skip: [:sessions]
  as :user do
  	get 'signup', to: 'devise/registrations#new'
	  get 'signin', to: 'devise/sessions#new', as: :new_user_session
	  post 'signin', to: 'devise/sessions#create', as: :user_session
	  delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :posts
end
