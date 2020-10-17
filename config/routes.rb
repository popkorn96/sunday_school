Rails.application.routes.draw do
  root 'application#home'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'

  resources :assignments, :only => [:show, :index, :edit, :new, :create, :update]

  resources :parents, :only => [:show, :new, :edit, :create, :update]

  resources :children, :only => [:show, :index, :edit, :new, :create, :update]

  resources :classrooms, :only => [:show, :index, :edit, :new, :create, :update]
  resources :classrooms, :only => [:show] do 
    resources :children, :only => [:show, :index, :new, :edit]
  end

  resources :teachers, :only => [:show, :edit, :new, :create, :update]
  resources :teachers, :only => [:show] do 
    resources :assignments, :only => [:show, :index, :new, :edit]
  end

  get '/assignments/search', to:'assignments#search'
  post '/search', to:'assignments#results'

  end
