Rails.application.routes.draw do
  get 'sessions/new'
  resources :coordinators
  resources :courses
  resources :locations
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#home'
  get '/help' , to:  'main#help'
  get '/signup', to: 'coordinators#new'
  post '/signup',  to: 'coordinators#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/locations/:id/courses', to: 'locations#courses', as: 'location_courses'
  get '/categories/:id/courses', to: 'categories#courses', as: 'category_courses'

end
