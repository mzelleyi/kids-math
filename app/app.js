import Resolver from 'resolver';
import registerComponents from 'kids-math/utils/register_components';

var App = Ember.Application.extend({
  LOG_ACTIVE_GENERATION: true,
  LOG_MODULE_RESOLVER: true,
  LOG_TRANSITIONS: true,
  LOG_TRANSITIONS_INTERNAL: true,
  LOG_VIEW_LOOKUPS: true,
  modulePrefix: 'kids-math',
  Resolver: Resolver
});

App.initializer({
  name: 'Register Components',
  initialize: function(container, application) {
    registerComponents(container);
  }
});

import hbsInitializer from 'kids-math/initializers/handlebars';
Ember.Application.initializer(hbsInitializer);

export default App;
