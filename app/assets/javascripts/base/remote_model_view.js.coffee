#= require 'base/model_view'

class @RemoteModelView extends ModelView
  preInitialize: (opts) ->
    super

    unless opts.dontFetch?
      @beforeFetch?()
      @model.fetch()
