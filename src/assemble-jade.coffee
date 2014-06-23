jade = require('jade')
_ = require('lodash')

plugin = ->

  init = ->

  compile = jade.compile
  render = jade.render
  registerFunctions = ->

  registerPartial = ->

  init: init
  compile: compile
  render: render
  registerFunctions: registerFunctions
  registerPartial: registerPartial

module.exports = exports = plugin()
