Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :teachers
  resources :students
  resources :courses do
    resources :tasks
  end
  
  resources :tasks do
    member do
      get 'result'
      get 'data',  :defaults => { :format => 'json' }
    end
    resources :homeworks do
      member do
        get 'result'
        get 'data',  :defaults => { :format => 'json' }
      end
    end
  end

end
