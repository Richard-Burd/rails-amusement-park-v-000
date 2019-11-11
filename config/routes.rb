Rails.application.routes.draw do

  # I'm getting an error on the browser that is generated by this file:
  # ./app/views/layouts/application.html.erb
  # ...on line 20 where it's looking to be directed to a non-existant root url:
  # <a class="navbar-brand" href="<%= root_url %>"/>Home</a>
  root "application#index"

  # The form_for Rails helper runs some backend code that is looking for:
  # users_path
  # In order to get rid of the error and get the users/new.html.erb to render,
  # I commented out the following lines:
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # Then I replaced them with this one and the users/new.html.erb rendered properly:
  resources :users, :only => [:create, :show]

  # get 'sessions/new'
  # get 'sessions/create'  #=> deleted this view because it is not needed
  # get 'sessions/destroy' #=> deleted this view because it is not needed
  # Set the sessions URL's to intuitive paths:
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/signup' => 'users#new'
  # NOTE: alternative syntax:
  # get '/signup', to: 'users#new'

  get 'rides/create'

  # get 'attractions/index'
  # get 'attractions/new'
  # get 'attractions/create'
  # get 'attractions/show'
  # Time to simplify these:
  resources :attractions,  :only => [:index, :new, :create, :show]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
