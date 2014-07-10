PostitTemplate::Application.routes.draw do
  get "posts/index"
  get "posts/show"
  root to: 'posts#index'

  resources :posts, except: [:destroy]
end
