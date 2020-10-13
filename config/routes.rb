Rails.application.routes.draw do
  get 'sessions/create'

  root 'application#home'
  get '/auth/facebook/callback' => 'sessions#create'
  get 'assignments/new'
  get 'assignments/edit'
  get 'assignments/index'
  get 'assignments/show'
  get 'parents/new'
  get 'parents/edit'
  get 'children/show'
  get 'children/new'
  get 'children/edit'
  get 'classrooms/show'
  get 'classrooms/index'
  get 'classrooms/new'
  get 'classrooms/edit'
  get 'teachers/show', to: 'teachers#show'
  get 'teachers/index'
  get 'teachers/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
