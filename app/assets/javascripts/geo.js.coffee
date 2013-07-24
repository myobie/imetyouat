class @Geo
  @currentLocation: null
  @toJSON: ->
    if @currentLocation
      latitude: @currentLocation[0]
      longitude: @currentLocation[1]
    else
      latitude: null
      longitude: null
  @locate: (cb) ->
    if @currentLocation
      cb @currentLocation
    else
      f = (position) =>
        @found position
        cb @currentLocation
      navigator.geolocation.getCurrentPosition f, @error
  @found: (position) =>
    @currentLocation = [position.coords.latitude,
                        position.coords.longitude]
  @error: (error) =>
    console.log "geo error", error
