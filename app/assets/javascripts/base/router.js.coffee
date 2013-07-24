class @BaseRouter extends Backbone.Router
  render: (opts = {}) ->
    if opts.template
      template = BaseView.jst opts.template
      view = new BaseView
      view.template = template
      BaseView.setContentView view
      return @

    if opts.view
      view = if _.isString opts.view
        klass = window[opts.view]
        new klass opts.viewOpts
      else
        opts.view

      BaseView.setContentView view
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

