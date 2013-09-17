module.exports = {
  compile: {
    files: {
      "tmp/public/assets/templates.js": ['app/templates/**/*.{emblem,hbs,hjs,handlebars}']
    },
    options: {
      root: 'app/templates/',
      dependencies: {
        jquery: 'vendor/jquery/jquery.js',
        ember: 'vendor/ember/index.js',
        handlebars: 'vendor/handlebars/handlebars.js',
        //you must put emblem.js here (or in another dir and specify appropriately)
        emblem: 'vendor/handlebars/emblem.js',
      }
    }
  }
};