class AppRouter extends Backbone.Router
  routes:
    "": "home"

  home: ->
    console.log "home"

appRouter = new AppRouter
