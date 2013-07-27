class @VenuesIndexView extends BaseView
  template: @jst 'venues/index'
  subViews:
    ".venues": "VenuesListView"
  events:
    "submit form": "searchFormSubmitted"
    "keyup input[type=search]": "typed"

  typed: (e) =>
    @typedF or= _.debounce @doSearch, 300
    @typedF()

  searchFormSubmitted: (e) =>
    e.preventDefault()
    @$("input[type=search]").get(0).blur()
    @doSearch()

  doSearch: () =>
    query = @$("input[type=search]").val()
    @trigger "search", query
