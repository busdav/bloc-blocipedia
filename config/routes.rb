Blocipedia::Application.routes.draw do
  
  resources :wikis do 
    post 'add_collaborators', on: :member
    resources :collaborators
  end
  
  resources :charges
  devise_for :users
  get "welcome/index"
  get "welcome/about"


  
  
  root :to => 'welcome#index'
end
