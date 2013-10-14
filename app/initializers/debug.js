//import App from 'cio/app';

var initializer = {
  name: 'debug',

  initialize:function (container, app) {
    app.debug = {
      controller: function(name){
        return container.lookup("controller:" + name);
      },
      route: function(name){
        return container.lookup("route:" + name);
      },
      view: function(domElem){
        return Em.View.views[domElem];
      },
      registry: container.registry.dict,
      //routes: Em.keys(app.Router.router.recognizer.names),
      store: container.lookup("store:main"),
      typeMaps: container.lookup("store:main").typeMaps,
      templates: Em.keys(Ember.TEMPLATES),
      observersFor: function(observedObj, key){
        Em.observersFor(observedObj, key);
      }
    };
  }
};


export default initializer;