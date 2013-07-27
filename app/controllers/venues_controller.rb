class VenuesController < ApplicationController
  respond_to :json

  def index
    unless params[:latitude].present? && params[:longitude].present?
      self.status = 400
      respond_with errors: ["Must provide latitude and longitude paramters"]
      return
    end

    api_params = {
      ll: [params[:latitude], params[:longitude]].join(','),
      intent: 'browse',
      query: params[:q],
      limit: 10,
      radius: 5_000
    }

    venues = api_get "venues/search", api_params

    if venues["meta"]["code"] == 200
      respond_with venues["response"]["venues"]
    else
      self.status = 500
      logger.error JSON.pretty_generate(venues)
      respond_with errors: ["Problem hitting the foursquare api right now"]
    end
  end

  def show
    venue = api_get "venues/#{params.require(:id)}"

    if venue["meta"]["code"] == 200
      respond_with venue["response"]["venue"]
    else
      self.status = 500
      # TODO: log venue response somewhere
      respond_with errors: ["Problem hitting the foursquare api right now"]
    end
  end

  private

  def api_get(path, opts = {})
    api_params = {
      client_id: ENV['FOURSQUARE_CLIENT_ID'],
      client_secret: ENV['FOURSQUARE_CLIENT_SECRET'],
      v: '20130723'
    }.merge(opts)

    res = RestClient.get File.join("https://api.foursquare.com/v2", path),
                         params: api_params,
                         accept: :json do |resp, req, result, &blk|
      result # let's let errors pass through
    end

    JSON.parse res.body
  end
end
