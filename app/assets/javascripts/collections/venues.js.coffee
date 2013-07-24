class @Venues extends Backbone.Collection
  url: '/venues'
  search: (latitude, longitude, q = '') ->
    @fetch
      reset: true
      data:
        latitude: latitude
        longitude: longitude
        q: q
    @
