Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

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
  post '/make_credit', to:'owners#make_credit'
  
  get 'destroy_log', to:'owners#destroy_log'
  
  get 'payment_log', to:'owners#payment_log'

  get '/everyday_activities', to:'calendars#everyday_activities'

  get 'balance_due', to:'owners#balance_due'

  get 'send_mail', to:'mails#send_mail'

  post '/mail', to: 'mails#mail'

  post '/update_smtp_mail', to: 'password_resets#update_smtp_mail'

  get '/edit_smtp_mail', to: 'password_resets#edit_smtp_mail'

  patch '/update_smtp_mail', to: 'password_resets#update_smtp_mail'
  
  get 'download_invoice', to:'downloads#show'
 

  resources :horses do
    collection do
      get :search
    end
    get :generate_document
  end

  resources :owners do
    collection do
      get :search
    end
    
  end
  
  resources :owners do
    get :add_document
  end
  
  resources :docs do
    get :download_file
    get :show
    get :destroy
    get :redirect_to_owner
    
  end

  resources :users, :horses, :owners, :horse_activities, :chains, :procedures, :activities, :pdf_generators, :docs



  resource :calendars, only: [:show], controller: :calendars

  resources :password_resets, only: [:new, :create, :edit, :update]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'

end