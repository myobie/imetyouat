#= require 'base/view'

class @CollectionView extends BaseView
  preInitialize: ->
    @collectionType = window[@collectionType] if _.isString @collectionType
    @collection = new @collectionType
    @listenTo @collection, "reset", @render

  constructor: (opts) ->
    @preInitialize()
    super
