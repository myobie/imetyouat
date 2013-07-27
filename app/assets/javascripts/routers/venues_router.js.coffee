class VenuesRouter extends BaseRouter
  routes:
    "venues/new(?*params)": "new"
    "venues/:id": "show"

  show: (id) ->
    @render view: new VenuesShowView(modelId: id)

  new: (params) ->
    @render json: @params()

@venuesRouter = new VenuesRouter
