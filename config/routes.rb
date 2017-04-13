Rails.application.routes.draw do

  get 'calendars/show'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'

  get 'static_pages/home'

  #get 'static_pages/help'
  get '/help', to: 'static_pages#help'

  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
  
  get 'procedure_menu', to: 'horse_activities#procedure_menu'
  
  get 'activity_menu', to:'horse_activities#activity_menu'

  delete '/logout', to: 'sessions#destroy'
  
  post '/update_activities', to:'horse_activities#update_activities'
  
  get '/destroy_from_horse', to:'horse_activities#destroy_from_horse'
  
  post '/make_payment', to:'owners#make_payment'
  
  get 'destroy_log', to:'owners#destroy_log'
  
  get 'payment_log', to:'owners#payment_log'

  get '/everyday_activities', to:'calendars#everyday_activities'

  get 'balance_due', to:'owners#balance_due'

  resources :horses do
    collection do
      get :search
    end
  end

  resources :owners do
    collection do
      get :search
    end
  end

  resources :users, :horses, :owners, :horse_activities, :chains, :procedures, :activities

  resource :calendars, only: [:show], controller: :calendars
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'

end
