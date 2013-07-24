RailsApp::Application.routes.draw do

  resources :venues

  get '/authorizations/github' => 'authorizations#github_authorize', as: :authorize_github
  get '/github_callback' => 'authorizations#github_callback'

  root to: 'homepage#index'

  get '*glob' => 'homepage#index'

end
