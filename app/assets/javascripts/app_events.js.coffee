$(document.body).on 'click', 'span[data-link]', (e) ->
  self = $(@)
  href = self.attr 'data-href'
  href = href.replace /^\//, ''

  if href.match /http:\/\//
    window.location = href
  else
    params = self.attr 'data-params'
    if params
      href += "?#{params}"
    Backbone.history.navigate href, trigger: true
