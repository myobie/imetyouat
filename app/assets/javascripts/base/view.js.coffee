class @BaseView extends Backbone.View
  render: ->
    @$el.html @template @
    @

  link: (name, path, opts = {}) ->
    s = document.createElement 'span'
    s.innerText = name
    for key, value of opts
      s[key] = value
    s.setAttribute 'data-link', true
    s.setAttribute 'data-href', path
    s.className += " link"
    s.outerHTML

  logged_in: window.logged_in
  current_user: window.current_user

  @currentContentView: null
  @setContentView: (view) ->
    if @currentContentView
      @currentContentView.remove()
    @currentContentView = view
    view.setElement document.getElementById "content"
    view.render()
