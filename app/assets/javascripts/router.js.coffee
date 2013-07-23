class AppRouter extends BaseRouter
  routes:
    "": "home"

  home: ->
    @render template: "home"

@appRouter = new AppRouter
