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

  resources :trails, only: [:index, :create] 

  get '/trails_by_distance' => 'trails#trails_by_distance'
  get '/trails_by_difficulty' => 'trails#trails_by_difficulty'
  get '/parks_by_location' => 'parks#parks_by_location'



 

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/facebook/callback' => 'sessions#facebook'
  #get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  

end
