#= require 'base/view'

class @ModelView extends BaseView
  preInitialize: (opts) ->
    @modelType = window[@modelType] if _.isString @modelType

    if opts.id?
      @model = new @modelType id: opts.id

    if opts.model?
      @model = opts.model
      delete opts.model

    unless opts.dontListen?
      @listenTo @model, "change", @render

  constructor: (opts) ->
    @preInitialize(opts)
    super
