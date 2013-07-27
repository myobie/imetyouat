class AppRouter extends BaseRouter
  routes:
    "": "home"
    "meet": "meet"
    "profile": "profile"

  home: ->
    navigationView.setPrimary 'Meet', '/meet'
    navigationView.setSecondary 'Profile', '/profile'
    @render template: "home"

  notFound: (glob) ->
    @render template: "404"

  meet: ->
    if false # venueChosen
      @render view: "MeetView"
    else
      @redirect "/venues"

  profile: ->
    @render json: currentUser

@appRouter = new AppRouter
