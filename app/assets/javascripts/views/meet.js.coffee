class @MeetView extends BaseView
  template: @jst 'meet'
  subViews:
    ".venues": "VenuesView"
  events:
    "submit form": "searchFormSubmitted"

  searchFormSubmitted: (e) =>
    e.preventDefault()
    query = @$("input[type=search]").val()
    @trigger "search", query
