Rails.application.routes.draw do
 
#  get route
  # get 'home/index'

# default route
  get ':controller(/:action(/:id))'

#root route
  root "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
