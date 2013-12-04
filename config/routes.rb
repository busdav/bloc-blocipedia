Blocipedia::Application.routes.draw do
  
  devise_for :users
  resources :wikis do 
    get :add_collaborators, on: :member
    post :save_collaborators, on: :member

    get :update_collaborators, on: :member
    put :final_update_collaborators, on: :member
  end
  
  resources :users
  resources :charges
  
  get "welcome/index"
  get "welcome/about"

  root :to => 'welcome#index'
end