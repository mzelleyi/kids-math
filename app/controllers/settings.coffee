SettingsController = Em.Controller.extend
  isShowingSettings: false
  isHidingSettings: Em.computed.not('isShowingSettings')
  actions:
    showSettings: -> @set 'isShowingSettings', true
    close: -> @set 'isShowingSettings', false

`export default SettingsController`