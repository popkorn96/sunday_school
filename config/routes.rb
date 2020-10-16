Rails.application.routes.draw do
  get 'sessions/create'

  root 'application#home'

  get '/auth/facebook/callback' => 'sessions#create'

  resources :assignments, :only => [:show, :index, :edit, :new, :create, :update]
  # get 'assignments/new'
  # get 'assignments/edit'
  # get 'assignments/index'
  # get 'assignments/show'
  resources :parents, :only => [:show, :new, :edit, :create, :update]
  # get 'parents/new'
  # get 'parents/edit'
  resources :children, :only => [:show, :index, :edit, :new, :create, :update]
  # get 'children/show'
  # get 'children/new'
  # get 'children/edit'
  resources :classrooms, :only => [:show, :index, :edit, :new, :create, :update]
  resources :classrooms, :only => [:show] do 
    resources :children, :only => [:show, :index, :new]
  end
  # get 'classrooms/show'
  # get 'classrooms/index'
  # get 'classrooms/new'
  # get 'classrooms/edit'
  resources :teachers, :only => [:show, :edit, :new, :create, :update]
  resources :teachers, :only => [:show] do 
    resources :assignments, :only => [:show, :index, :new]
  end
  # get 'teachers/show', to: 'teachers#show'
  # get 'teachers/index'
  # get 'teachers/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
