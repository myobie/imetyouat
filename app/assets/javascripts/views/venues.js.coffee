class @VenuesView extends CollectionView
  collectionType: 'Venues'
  template: @jst 'nearby_venues'

  initialize: ->
    @listenTo @parent, "search", @search
    @search()

  search: (query) ->
    Geo.locate (pos) =>
      @collection.search pos[0], pos[1], query
