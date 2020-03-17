Rails.application.routes.draw do
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


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
