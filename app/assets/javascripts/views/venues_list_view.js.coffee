class @VenuesListView extends CollectionView
  collectionType: 'Venues'
  template: @jst 'venues/list'

  heading: ->
    if @searching
      "Search results"
    else
      "Nearby places"

  initialize: ->
    @listenTo @parent, "search", @search
    @listenTo @parent, "clearSearch", @clearSearch
    @search()

  startLoading: ->
    @loading = true
    @collection.reset()

  finishedLoading: ->
    @loading = false

  clearSearch: ->
    @search()

  search: (query) ->
    @lastQuery = query

    if query and query isnt ''
      @searching = true
    else
      @searching = false

    @startLoading()

    Geo.locate (pos) =>
      @collection.search pos[0], pos[1], query, success: =>
        @finishedLoading()
      , error: =>
        @finishedLoading()
        @collection.reset []
