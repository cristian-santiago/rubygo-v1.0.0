Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :password]
  as :user do

    get 'admin', to: 'devise/sessions#new', as: :user_session
    post 'admin', to: 'devise/sessions#create', as: :new_user_session
    delete 'log_out', to: 'devise/sessions#destroy', as: :destroy_user_session

    
  end
  resources :about
  
  resources :categories

  resources :blogs

  #resources :all_blogs
  get 'all-blogs', to: 'all_blogs#index'

  post 'uploader/image', to: 'uploader#image'
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root  "blogs#index"  

end


 

