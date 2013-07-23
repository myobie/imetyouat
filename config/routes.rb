RailsApp::Application.routes.draw do

  get '/authorizations/github' => 'authorizations#github_authorize', as: :authorize_github
  get '/github_callback' => 'authorizations#github_callback'

  root to: 'homepage#index'
end
