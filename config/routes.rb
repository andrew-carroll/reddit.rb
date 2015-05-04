Rails.application.routes.draw do
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/register', to: 'registrations#create', as: 'registration'

  get '/subreddits/create', to: 'subreddits#new', as: 'new_subreddit'
  post '/subreddits/create', to: 'subreddits#create'
  scope '/r/:subreddit_id' do
    get '/', to: 'subreddit/posts#index', as: 'subreddit'
  end
end
