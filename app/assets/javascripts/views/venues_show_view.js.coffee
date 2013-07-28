class @VenuesShowView extends RemoteModelView
  modelType: 'Venue'
  template: @jst 'venues/show'

  isLoaded: ->
    @model.get('name')?

  name: ->
    @model.get('name')

  categories: ->
    cats = _(@model.get('categories')).map (cat) -> cat.name
    last_cat = cats.pop()
    cats_string = cats.join(", ")
    _([cats_string, last_cat]).compact().join(" and ")

  address: ->
    @model.formattedAddress()

  mapURL: ->
    loc = @model.get('location')
    ll = [loc.lng, loc.lat].join(",")
    size = "320x140"
    zoom = 13
    marker = "pin-s+D40D12(#{ll})"
    "http://a.tiles.mapbox.com/v3/myobie.map-j6ywpujq/#{marker}/#{ll},#{zoom}/#{size}.png"
