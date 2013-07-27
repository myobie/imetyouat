#= require 'base/view'

class @ModelView extends BaseView
  preInitialize: (opts) ->
    @modelType = window[@modelType] if _.isString @modelType

    if opts.modelId?
      @model = new @modelType id: opts.modelId

    unless opts.dontListen?
      @listenTo @model, "change", @render

  constructor: (opts) ->
    @preInitialize(opts)
    super
