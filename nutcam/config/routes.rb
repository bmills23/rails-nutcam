Rails.application.routes.draw do
  get 'live', to: 'stream#live'

  root 'welcome#index'

  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
