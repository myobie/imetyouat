class HomepageController < ApplicationController
  def index
    if Rails.env.production?
      render :placeholder
    end
  end

  def placeholder
  end
end
