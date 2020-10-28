Rails.application.routes.draw do
  root 'application#home'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  
  get '/auth/facebook/callback' => 'sessions#create'

  resources :assignments, :only => [:show, :index, :edit, :new, :create, :update]

  resources :parents, :only => [:show, :new, :edit, :create, :update]

  resources :children, :only => [:show, :index, :edit, :new, :create, :update]

  resources :classrooms, :only => [:show, :index, :edit, :new, :create, :update]
  resources :classrooms, :only => [:show] do 
    resources :children, :only => [:show, :index, :new, :edit]
  end

  resources :teachers, :only => [:show, :index, :edit, :new, :create, :update]
  resources :teachers, :only => [:show, :index] do 
    resources :assignments, :only => [:show, :index, :new, :edit, :update]
  end


  get '/children/search', to:'children#search'
  post '/children/search', to:'children#results'

  end
