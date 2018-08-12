Rails.application.routes.draw do
 
  root 'welcome#index'
  resources :users do 
    shallow do 
    resources :parks do 
      resources :trails do
        resources :comments
      end 
      
    end
  end
  end

  resources :parks, only: [:index]

  #resources :trails, only: [:show, :index, :create] 

 # resources :comments, only: [:index, :new, :create]

 

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

end
