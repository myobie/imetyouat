class @VenuesShowView extends RemoteModelView
  modelType: 'Venue'
  template: @jst 'venues/show'

  render: ->
    if !Geo.currentLocation
      Geo.location @render
    else
      super
    @

  mapURL: ->
    loc = @model.get('location')
    ll = [loc['lat'], loc["lng"]].join(",")
    base = "http://maps.googleapis.com/maps/api/staticmap?"
    opts =
      size: "320x150"
      center: ll
      zoom: 13
      sensor: false
      markers: "color:green|#{ll}"

    optsString = ""
    for key, value of opts
      optsString += "#{key}=#{encodeURIComponent value}&"

    "#{base}#{optsString}"
