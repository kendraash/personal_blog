Rails.application.routes.draw do
  root :to => 'tags#index'

  resources :tags do
    resources :posts
  end
end
