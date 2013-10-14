SettingsController = Em.ObjectController.extend
  isShowingSettings: false
  isHidingSettings: Em.computed.not('isShowingSettings')
  actions:
    showSettings: -> @set 'isShowingSettings', true
    close: -> @set 'isShowingSettings', false
    save: ->
      @set('model.kidsNames', @get 'kidsNames')
      @get('model').save()
      @set 'isShowingSettings', false

`export default SettingsController`