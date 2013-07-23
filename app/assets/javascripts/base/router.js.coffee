class @BaseRouter extends Backbone.Router
  render: (opts = {}) ->
    if opts.template
      template = JST["templates/#{opts.template}"]
      data = @templateData()
      html = template data
      @setContent html

  setContent: (html) ->
    $("#content").html html

  templateData: -> {}
