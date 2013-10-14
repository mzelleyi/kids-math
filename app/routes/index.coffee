IndexRoute = Ember.Route.extend
  model: (params, queryParams, transition) ->
    @store.findAll "settings"

  setupController: (controller, model, queryParams) ->
    console.log('index route')
    model = if (model.get('length') > 0) then model.objectAt(0) else @store.createRecord('settings')
    this.controllerFor('settings').set('model', model)
    if model.get('kidsNames')
      this.controllerFor('settings').set('kidsNames', model.get('kidsNames'))
    this.controllerFor('equation').generateEquation()

`export default IndexRoute`
