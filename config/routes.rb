# frozen_string_literal: true
Rails.application.routes.draw do
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  get '/tasks' => 'tasks#index'
  post '/tasks/:id' => 'tasks#create'
  patch '/tasks-update/:id' => 'tasks#update'
  delete '/tasks-delete/:id' => 'tasks#delete'
  resources :users, only: [:index, :show]
end
