class @MeetView extends BaseView
  template: @jst 'meet'
  subViews:
    ".venues": "VenuesListView"
  events:
    "submit form": "searchFormSubmitted"
    "keyup input[type=search]": "typed"

  typed: (e) =>
    @typedF or= _.debounce @searchFormSubmitted, 300
    @typedF()

  searchFormSubmitted: (e) =>
    e.preventDefault() if e
    query = @$("input[type=search]").val()
    @trigger "search", query
