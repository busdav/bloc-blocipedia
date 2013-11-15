Blocipedia::Application.routes.draw do
  resources :wikis

  devise_for :users

  get "welcome/index"

  get "welcome/about"

  root :to => 'welcome#index'
end
