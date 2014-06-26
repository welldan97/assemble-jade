(function() {
  var exports, jade, plugin, _;

  jade = require('jade');

  _ = require('lodash');

  plugin = function() {
    var allOptions, compile, init, locals, partials, registerFunctions, registerPartial, render;
    allOptions = void 0;
    locals = {};
    partials = {};
    locals.partial = function(name) {
      if (!_.has(partials, name)) {
        throw "Template " + name + " not found";
      }
      return jade.render(partials[name], allOptions);
    };
    init = function() {};
    compile = function(source, options, callback) {
      allOptions = _.merge({}, options, locals, {
        options: options
      });
      return jade.compile(source, allOptions, callback);
    };
    render = function(templateOrSource, options, callback) {
      var content;
      allOptions = _.merge({}, options, locals, {
        options: options
      });
      if (_.isString(templateOrSource)) {
        return jade.render(templateOrSource, allOptions, callback);
      } else {
        content = templateOrSource.compile(allOptions);
        return callback(null, content);
      }
    };
    registerFunctions = function(helperFunctions) {
      if (_(helperFunctions).isEmpty()) {
        return;
      }
      return _.merge(locals, helperFunctions);
    };
    registerPartial = function(filename, content) {
      return partials[filename] = content;
    };
    return {
      init: init,
      compile: compile,
      render: render,
      registerFunctions: registerFunctions,
      registerPartial: registerPartial
    };
  };

  module.exports = exports = plugin();

}).call(this);
