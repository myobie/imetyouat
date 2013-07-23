class @BaseRouter extends Backbone.Router
  render: (opts = {}) ->
    if opts.template
      template = JST["templates/#{opts.template}"]
      view = new BaseView
      view.template = template
      view.setElement document.getElementById "content"
      view.render()
