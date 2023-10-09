Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  get 'live', to: 'stream#live'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
