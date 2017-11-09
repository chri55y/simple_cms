Rails.application.routes.draw do

  # add non-default delete
  resources :sections do
    member do
      get :delete
    end
  end


  # add non-default delete
  resources :pages do
    member do
      get :delete
    end
  end


  root 'demo#index'

  resources :subjects do
    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  # ch 9.7
  get 'demo/escape_output'

  
  # default route: may go away in future rails versions
  # get ':controller(/:action(/:id))'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
