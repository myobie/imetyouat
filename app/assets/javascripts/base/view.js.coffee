class @BaseView extends Backbone.View
  @jst: (name) -> JST["templates/#{name}"]

  render: ->
    @beforeRender?()
    @$el.html @template @
    @afterRender?()
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

  loggedIn: window.loggedIn
  currentUser: window.currentUser

  @currentContentView: null
  @contentDiv: document.getElementById "content"
  @setContentView: (view) ->
    @currentContentView.remove() if @currentContentView
    @currentContentView = view
    view.render().appendTo @contentDiv
