class @BaseView extends Backbone.View
  @jst: (name) -> JST["templates/#{name}"]

  render: (opts = {}) ->
    @beforeRender?()
    @$el.html @template @
    @renderSubViews() unless opts.shallow?
    @afterRender?()
    @

  partial: (name) ->
    names = name.split("/")
    names[names.length-1] = "\_#{names[names.length-1]}"
    name = names.join("/")
    console.log name
    template = BaseView.jst(name)
    template @

  remove: ->
    for selector, child of @children
      console.log selector, child
      child.remove()
    @children = {}
    super

  renderSubViews: ->
    for selector, view of @subViews
      child = @addSubView selector, view
      child.render()
    @

  addSubView: (selector, view) ->
    child = @children[selector]
    if child?
      child
    else
      @subViews[selector] = view unless @subViews[selector]?
      child = @prepareSubView selector, view
      @children[selector] = child
      child

  constructor: (opts) ->
    @parent = opts?.parent
    @subViews or= {}
    @subViewOpts or= {}
    @children or= {}
    super

  prepareSubView: (selector, view) ->
    element = @$(selector).get(0)
    view = window[view] if _.isString view
    opts = parent: @
    _.extend opts, @subViewOpts
    instance = new view opts
    instance.setElement element
    instance

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
