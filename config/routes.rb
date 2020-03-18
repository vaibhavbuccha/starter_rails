Rails.application.routes.draw do
=begin
  get 'pages/index'
  get 'pages/new'
  get 'pages/show'
  get 'pages/edit'
  get 'pages/delete'
  get 'section/index'
  get 'section/new'
  get 'section/show'
  get 'section/edit'
  get 'section/delete'=end
=begin
  get 'subjects/index'
  get 'subjects/new'
  get 'subjects/show'
  get 'subjects/edit'
  get 'subjects/delete'
=end
=begin
  get 'subject/index'
  get 'subject/new'
  get 'subject/show'
  get 'subject/edit'
  get 'subject/delete'
=end
#  get route
  # get 'home/index'

# default route
  get ':controller(/:action(/:id))'
  
#root route
  root "home#index"

# resourcefull routes
  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :section do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
