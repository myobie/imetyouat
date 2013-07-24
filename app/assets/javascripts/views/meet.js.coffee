class @MeetView extends BaseView
  template: @jst 'meet'

  initialize: ->
    @venues = new Venues
    @listenTo @venues, "reset", (col) -> console.log col

  afterRender: ->
    Geo.locate (pos) =>
      console.log pos
      @venues.search pos[0], pos[1]
      @
