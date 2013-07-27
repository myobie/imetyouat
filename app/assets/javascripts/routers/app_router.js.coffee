class AppRouter extends BaseRouter
  routes:
    "": "home"
    "meet": "meet"
    "profile": "profile"

  home: ->
    @render template: "home"

  notFound: (glob) ->
    @render template: "404"

  meet: ->
    @render view: "MeetView"

  profile: ->
    @render json: currentUser

@appRouter = new AppRouter
