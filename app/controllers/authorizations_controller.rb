class AuthorizationsController < ApplicationController
  def github_authorize
    redirect_to github_oauth_authorize_url
  end

  def github_callback
    if params[:state] == github_session_state
      access_token = github_access_token_from_code(params[:code])
      user = User.from_github(access_token)
      cookies[:remember_me] = user.remember_me_token
      cookies[:user_id] = user.id
      redirect_to root_path
    else
      head 400
    end
  end

  private

  def github_access_token_from_code(code)
    response = RestClient.post "https://github.com/login/oauth/access_token",
                               {
                                 client_id: ENV['GITHUB_CLIENT_ID'],
                                 client_secret: ENV['GITHUB_CLIENT_SECRET'],
                                 code: code
                               },
                               accept: :json
    if response.code == 200
      json = JSON.parse response.body
      if json.present?
        json["access_token"]
      end
    end
  end

  def github_oauth_authorize_url
    uri = URI::HTTPS.build host: "github.com",
                           path: "/login/oauth/authorize",
                           query: {
                             client_id: ENV['GITHUB_CLIENT_ID'],
                             scope: "user:email",
                             state: github_session_state
                           }.to_query
    uri.to_s
  end

  def github_session_state
    session[:github_state] ||= SecureRandom.hex(32)
  end
end
