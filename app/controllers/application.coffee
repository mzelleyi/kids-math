ApplicationController = Em.Controller.extend
  needs: ['config']
  kidsNames: Em.computed.alias("controllers.config.kidsNames")
  greeting: (->
    greetingArray = for name in @get('kidsNames')
                      "Hello #{name}!"
    greetingArray.join(" ")
  ).property("learnerNames")
  isShowingSettings: false
  actions:
    showSettings: ->
      console.log 'showSets'
      @set 'isShowingSettings', true
      console.log "showSets #{@get 'isShowingSettings'}"

`export default ApplicationController`