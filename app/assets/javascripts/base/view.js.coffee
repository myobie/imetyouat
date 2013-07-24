class @BaseView extends Backbone.View
  render: ->
    @$el.html @template @
    @

  appendTo: (element) ->
    element.appendChild @el

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
  @contentDiv: document.getElementById "content"
  @setContentView: (view) ->
    @currentContentView.remove() if @currentContentView
    @currentContentView = view
    view.render().appendTo @contentDiv
