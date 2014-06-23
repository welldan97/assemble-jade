# Assemble Jade [![NPM version](https://badge.fury.io/js/assemble-jade.png)](http://badge.fury.io/js/assemble-jade)

[Assemble](http://assemble.io/) engine plugin for processing [jade](http://jade-lang.com/) templates.

## Getting Started

```shell
npm install assemble-jade --save-dev
```

Switch to jade engine in your Gruntfile

```js
grunt.initConfig({
  assemble: {
    options: {
      engine: 'jade'
    }
  }
});
```

Using helpers will be straightforward as calling their names. As for
partials, by using this module you'll have to use this jade syntax:

```jade
!= partial('sidebar')
```

Thanks
