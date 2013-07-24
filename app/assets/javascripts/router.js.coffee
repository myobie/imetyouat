class AppRouter extends BaseRouter
  routes:
    "": "home"
    "meet": "meet"
    "profile": "profile"
    "*glob": "notFound"

  home: ->
    @render template: "home"

  notFound: ->
    @render template: "404"

  meet: ->
    @render html: "I guess it works"

  profile: ->
    @render json: current_user

@appRouter = new AppRouter

$(document.body).on 'click', 'span[data-link]', (e) ->
  self = $(@)
  href = self.attr 'data-href'
  href = href.replace /^\//, ''
  appRouter.navigate href, trigger: true
