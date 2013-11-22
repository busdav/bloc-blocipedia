Blocipedia::Application.routes.draw do
  
  resources :wikis do 
    resources :collaborators
  end
  
  resources :charges
  devise_for :users
  get "welcome/index"
  get "welcome/about"

  root :to => 'welcome#index'
end