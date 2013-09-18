EquationController = Em.Controller.extend
  isAnsweredState: false
  isCorrectState: false
  correctAnswer: (->
    console.log("eqText: #{@get('equationText')}")
    eval @get('equationText')
  ).property('equationText')
  nums: []
  num1: (-> @get('nums').objectAt(0)).property('nums')
  num2: (-> @get('nums').objectAt(1)).property('nums')
  num1Array: (->  @_numArray(@get 'num1')).property('num1')
  num2Array: (->  @_numArray(@get 'num2')).property('num2')
  operation: '+'
  lowerBound: 0
  upperBound: 5
  expanse: (-> @get('upperBound') - @get('lowerBound')).property("lowerBound","upperBound")
  answer: 0
  answerArray: (-> [1..@get('answer')]).property('answer')
  answerRange: (->
    [@get('lowerBound')..2*@get('expanse')]
  ).property("lowerBound", "upperBound", "expanse")
  equationText: (->
    num1 = @get('nums').objectAt(0)
    num2 = @get('nums').objectAt(1)
    text = "#{num1}#{@get('operation')}#{num2}"
    console.log("eqT: #{text}")
    text
  ).property("nums", "operation")
  genInt: ->
    Math.floor(Math.random() * @get('expanse')) + @get('lowerBound')
  generateEquation: ->
    @set 'nums', [@genInt(), @genInt()]
  _numArray: (num, start=0) ->
    return [] if num <= start
    [start+1..num+start]
  message: "I'm a msg"
  actions:
    verifyAnswer: (answer)->
      return if @get('isAnsweredState')
      @set('isAnsweredState', false)
      #Em.$('answer-visual').empty()
      @set('answer', answer)
      @set('isAnsweredState', true)
      correct = @get('correctAnswer')
      console.log "verifyAnswer: #{answer}"
      if (0+answer == correct)
        @set('message', "Right!!")
        @set('isCorrectState', true)
      else
        @set('isCorrectState', false)
        if (0+answer > correct)
          @set('message', "Too high!")
        else
          @set('message', "Too low!")
    tryAgain: ->
      @set('isAnsweredState', false)
    goAgain: ->
      @generateEquation()
      @set('isAnsweredState', false)

`export default EquationController`