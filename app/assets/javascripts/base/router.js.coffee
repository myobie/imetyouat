class @BaseRouter extends Backbone.Router
  render: (opts = {}) ->
    if opts.template
      template = JST["templates/#{opts.template}"]
      view = new BaseView
      view.template = template
      BaseView.setContentView view
