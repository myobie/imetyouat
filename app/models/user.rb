class User < ActiveRecord::Base
  before_save :generate_remember_me_token

  def self.from_github(access_token)
    temp_user = new github_access_token: access_token
    temp_user.fill_in_github_info!
    existing_user = where(github_id: temp_user.github_id.to_s).first

    if existing_user.present?
      existing_user.update_github_access_token access_token
      existing_user
    else
      temp_user.save
      temp_user
    end
  end

  def update_github_access_token(access_token)
    if github_access_token != access_token
      self.github_access_token = access_token
      save
    end
  end

  def fill_in_github_info!
    user_json = RestClient.get "https://api.github.com/user",
                               params: { access_token: github_access_token },
                               accept: :json
    user_info = JSON.parse user_json
    self.github_id = user_info["id"]
    self.name ||= user_info["name"]
    self.email ||= user_info["email"]
    self
  end

  private

  def generate_remember_me_token
    self.remember_me_token ||= SecureRandom.hex(64)
  end
end
