class @VenuesView extends CollectionView
  collectionType: 'Venues'
  template: @jst 'nearby_venues'

  initialize: ->
    Geo.locate (pos) =>
      @collection.search pos[0], pos[1]
