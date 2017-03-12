Rails.application.routes.draw do
  get 'teachers/show'

  get 'students/show'

  root 'static_pages#home'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
  resources :teachers
  resources :students
end
