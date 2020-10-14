Rails.application.routes.draw do
  get 'sessions/create'

  root 'application#home'

  get '/auth/facebook/callback' => 'sessions#create'

  resources :assignments, :only => [:show, :index, :edit, :new]
  # get 'assignments/new'
  # get 'assignments/edit'
  # get 'assignments/index'
  # get 'assignments/show'
  resources :parents, :only => [:show, :new, :edit, :create]
  # get 'parents/new'
  # get 'parents/edit'
  resources :children, :only => [:show, :index, :edit, :new]
  # get 'children/show'
  # get 'children/new'
  # get 'children/edit'
  resources :classrooms, :only => [:show, :index, :edit, :new]
  # get 'classrooms/show'
  # get 'classrooms/index'
  # get 'classrooms/new'
  # get 'classrooms/edit'
  resources :teachers, :only => [:show, :edit, :new, :create]
  # get 'teachers/show', to: 'teachers#show'
  # get 'teachers/index'
  # get 'teachers/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
