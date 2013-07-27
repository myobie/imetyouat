#= require base/view
#= require templates/navigation

class NavigationView extends BaseView
  template: @jst 'navigation'

  primaryButton: null
  secondaryButton: null

  setButtons: (primary, secondary) ->
    if @loggedIn
      if primary
        @primaryButton = if primary.href
          primary

      if secondary
        @secondaryButton = if secondary.href
          secondary
    else
      @primaryButton = null
      @secondaryButton = null

    @render()

  setPrimary: (title, href, opts = {}) ->
    opts.title = title
    opts.href = href
    @setButtons opts, null

  setSecondary: (title, href, opts = {}) ->
    opts.title = title
    opts.href = href
    @setButtons null, opts

  setPrimaryToHome: ->
    @setPrimary 'Home', '/'

  clear: ->
    @setButtons {}, {}


@navigationView = new NavigationView

el = document.getElementById "navigation"
@navigationView.setElement el
