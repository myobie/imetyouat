#= require models/venue

class @Venues extends Backbone.Collection
  model: Venue
  url: '/venues'
  search: (latitude, longitude, q = '', cbs = {}) ->
    cbs.error or= (collection) ->
      collection.reset []

    @fetch
      reset: true
      data:
        latitude: latitude
        longitude: longitude
        q: q
      success: cbs.success
      error: cbs.error
    @
