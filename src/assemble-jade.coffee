jade = require('jade')
_ = require('lodash')

plugin = ->
  allOptions = undefined

  locals = {}
  partials = {}

  locals.partial = (name) ->
    throw "Template #{name} not found" unless _.has(partials, name)

    jade.render partials[name], allOptions

  init = ->

  compile = (source, options, callback) ->
    jade.compile source, options, callback

  render = (templateOrSource, options, callback) ->
    allOptions = _.merge({}, options, locals)

    if _.isString(templateOrSource)
      jade.render(templateOrSource, allOptions, callback)
    else
      content = templateOrSource.compile(allOptions)
      callback null, content

  registerFunctions = (helperFunctions) ->
    return if _(helperFunctions).isEmpty()

    _.merge locals, helperFunctions

  registerPartial = (filename, content) ->
    partials[filename] = content

  init: init
  compile: compile
  render: render
  registerFunctions: registerFunctions
  registerPartial: registerPartial

module.exports = exports = plugin()
