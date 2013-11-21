Blocipedia::Application.routes.draw do
  resources :wikis
  resources :charges
  
  devise_for :users

  get "welcome/index"

  get "welcome/about"


  root :to => 'welcome#index'
end
