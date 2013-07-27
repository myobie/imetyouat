class AppRouter extends BaseRouter
  routes:
    "": "home"
    "meet": "meet"
    "profile": "profile"
    "*glob": "notFound"

  home: ->
    @render template: "home"

  notFound: (glob) ->
    @render template: "404"

  meet: ->
    @render view: "MeetView"

  profile: ->
    @render json: currentUser

@appRouter = new AppRouter

$(document.body).on 'click', 'span[data-link]', (e) ->
  self = $(@)
  href = self.attr 'data-href'
  href = href.replace /^\//, ''
  params = self.attr 'data-params'
  if params
    href += "?#{params}"
  appRouter.navigate href, trigger: true
