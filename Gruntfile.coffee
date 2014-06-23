module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'lib/assemble-jade.js': ['src/*.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.registerTask 'default', ['coffee']
