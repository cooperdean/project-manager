Rails.application.routes.draw do

  get 'about/index' => "about#index", as: :about

  get 'users/show'

  resources :comments

  resources :tasks

  resources :watches

  devise_for :users
  get 'users/:id' => 'users#show', as: :user
  resources :projects

  patch "/tasks/:id" => "task#toggle_task", as: :toggle_task

  resources :projects do
  resources :tasks, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :watches, only: [:create, :destroy]
end

  root "projects#index"

end
