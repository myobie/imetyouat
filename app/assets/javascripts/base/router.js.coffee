class @BaseRouter extends Backbone.Router
  render: (opts = {}) ->
    if opts.template
      template = JST["templates/#{opts.template}"]
      view = new BaseView
      view.template = template
      BaseView.setContentView view
      return @

    if opts.view
      BaseView.setContentView opts.view
      return @

    if opts.html
      view = new BaseView
      view.template = _.template opts.html
      BaseView.setContentView view
      return @

    if opts.json
      view = new BaseView
      text = if _.isString opts.json
        opts.json
      else
        JSON.stringify opts.json, false, 3
      view.template = _.template "<pre>#{text}</pre>"
      BaseView.setContentView view
      return @

