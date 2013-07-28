class @Venue extends Backbone.Model
  urlRoot: '/venues'

  hasAddress: ->
    !!@get('location').address

  formattedAddress: ->
    loc = @get('location')
    result = loc.address
    result += " (#{loc.crossStreet})" if loc.crossStreet
