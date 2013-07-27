$(document.body).on 'click', 'span[data-link]', (e) ->
  self = $(@)
  href = self.attr 'data-href'
  href = href.replace /^\//, ''
  params = self.attr 'data-params'
  if params
    href += "?#{params}"
  Backbone.history.navigate href, trigger: true
