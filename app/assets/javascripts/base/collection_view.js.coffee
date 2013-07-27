#= require 'base/view'

class @CollectionView extends BaseView
  preInitialize: (opts) ->
    @collectionType = window[@collectionType] if _.isString @collectionType

    if opts.collection?
      @collection = opts.collection
      delete opts.collection
    else
      @collection = new @collectionType

    unless opts.dontListen?
      @listenTo @collection, "reset", @render

  constructor: (opts) ->
    @preInitialize(opts)
    super
