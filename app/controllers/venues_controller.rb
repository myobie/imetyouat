class VenuesController < ApplicationController
  respond_to :json

  def index
    unless params[:latitude].present? && params[:longitude].present?
      self.status = 400
      respond_with errors: ["Must provide latitude and longitude paramters"]
      return
    end

    api_params = {
      client_id: ENV['FOURSQUARE_CLIENT_ID'],
      client_secret: ENV['FOURSQUARE_CLIENT_SECRET'],
      ll: [params[:latitude], params[:longitude]].join(','),
      intent: 'browse',
      query: params[:q],
      v: '20130723',
      limit: 10,
      radius: 5_000
    }

    res = RestClient.get "https://api.foursquare.com/v2/venues/search",
                         params: api_params,
                         accept: :json

    venues = JSON.parse res.body

    if venues["meta"]["code"] == 200
      respond_with venues["response"]["venues"]
    else
      self.status = 500
      # TODO: log venues response somewhere
      respond_with errors: ["Problem hitting the foursquare api right now"]
    end
  end
end
