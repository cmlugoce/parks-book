Rails.application.routes.draw do
  
  root 'welcome#index'
  resources :users do 
    shallow do 
    resources :parks do 
      resources :trails 
      
    end
  end
  end

  resources :parks, only: [:index]

  resources :trails, only: [:show, :index, :create] 

  resources :parks do 
    resources :comments, module: :parks
  end 

  resources :trails do
    resources :comments, module: :trails
  end 
  

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
