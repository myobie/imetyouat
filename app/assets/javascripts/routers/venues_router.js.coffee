class VenuesRouter extends BaseRouter
  routes:
    "venues": "index"
    "venues/new(?*params)": "new"
    "venues/:id": "show"

  show: (id) ->
    @render view: new VenuesShowView(modelId: id)

  new: (params) ->
    @render json: @params()

  index: ->
    navigationView.setPrimaryToHome()
    @render view: "VenuesIndexView"

@venuesRouter = new VenuesRouter
