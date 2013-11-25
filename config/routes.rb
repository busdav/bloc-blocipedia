Blocipedia::Application.routes.draw do
  
  resources :wikis do 
    get :add_collaborators, on: :member
    post :save_collaborators, on: :member
  end
  
  resources :charges
  devise_for :users
  get "welcome/index"
  get "welcome/about"


  
  
  root :to => 'welcome#index'
end
