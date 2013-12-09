Blocipedia::Application.routes.draw do
  
  devise_for :users
  resources :wikis do 
    get :manage_collaborators, on: :member
    post :save_collaborators, on: :member
  end
  
  resources :users
  resources :charges
  
  get "welcome/index"
  get "welcome/about"

  root :to => 'welcome#index'
end