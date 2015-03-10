Link::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => :registrations }
  devise_for :admins
  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end
  devise_scope :admin do
    get "teachers/login" => "devise/sessions#new"
  end

  get '/token' => 'home#token', as: :token

  get '/teachers/manage' => 'admins#manage', as: :manage

  get '/dashboard' => 'dashboard#index', as: :dashboard

  get '/pupils/:username' =>  'users#show', as: :user_profile

  get '/pupils/:id', :to => 'users#show', :as => :user
 
  resources :home, only: :index
  resources :teachers, :controller => "admins" do
    post 'add_student', to: 'admins#add_student', as: :admins_add_student
  end

  root to: "dashboard#index"
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :mark_as_read
    end
  end
  resources :messages, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
    end
  end

end
