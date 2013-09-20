import Index from 'kids-math/routes/index';
import App from 'kids-math/app';

var route;

module("Unit - IndexRoute", {
  setup: function(){
    route = App.__container__.lookup('route:index');
  }
});

test("it exists", function(){
  ok(route);
  ok(route instanceof Ember.Route);
});

