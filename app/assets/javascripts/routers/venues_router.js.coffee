class VenuesRouter extends BaseRouter
  routes:
    "venues/new(?*params)": "new"
    "venues/:id": "show"

  show: (id) ->
    @render json: { id: id }

  new: (params) ->
    @render json: @params()

@venuesRouter = new VenuesRouter
