import Resolver from 'resolver';

var App = Ember.Application.create({
  LOG_ACTIVE_GENERATION: true,
  LOG_VIEW_LOOKUPS: true,
  modulePrefix: 'kids-math',
  Resolver: Resolver
});

import hbsInitializer from 'kids-math/initializers/handlebars';
Ember.Application.initializer(hbsInitializer);

import routes from 'kids-math/routes';
App.Router.map(routes);

export default App;
