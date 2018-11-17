Rails.application.routes.draw do
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :courses
  get '/auth/:provider/callback' => 'sessions#create'

 get '/signout' => 'sessions#destroy', :as => :signout

 get '/signin' => 'sessions#new', :as => :signin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root :to => "courses#index"
  end
root :to => redirect("/users/sign_in")
  
end
