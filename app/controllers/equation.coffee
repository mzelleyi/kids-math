EquationController = Em.Controller.extend
  isAnsweredState: false
  isCorrectState: false
  correctAnswer: (->
    eval @get('equationText')
  ).property('equationText')
  nums: []
  num1: (-> @get('nums').objectAt(0)).property('nums')
  num2: (-> @get('nums').objectAt(1)).property('nums')
  num1Array: (->  @_numArray(@get 'num1')).property('num1')
  num2Array: (->  @_numArray(@get 'num2')).property('num2')
  operation: '+'
  showOperationInVisualization: (-> @get('num1') and @get('num2')).property('num1', 'num2')
  lowerBound: 0
  upperBound: 6
  expanse: (-> @get('upperBound') - @get('lowerBound')).property("lowerBound","upperBound")
  answer: null
  answerArray: (-> @_numArray(@get 'answer') ).property('answer')
  answerRange: (->
    [@get('lowerBound')..2*(@get('expanse')-1)]
  ).property("lowerBound", "upperBound", "expanse")
  equationText: (->
    num1 = @get('nums').objectAt(0)
    num2 = @get('nums').objectAt(1)
    "#{num1}#{@get('operation')}#{num2}"
  ).property("nums", "operation")
  genInt: ->
    Math.floor(Math.random() * @get('expanse')) + @get('lowerBound')
  generateEquation: ->
    @set 'nums', [@genInt(), @genInt()]
  _numArray: (num, start=0) ->
    return [] if num <= start
    [start+1..num+start]
  message: "I'm a msg"
  buttonLabel: (->
    if @get('isCorrectState')
      "Go again"
    else
      "Try again"
  ).property('isCorrectState')

  actions:
    verifyAnswer: (answer)->
      return if @get('isAnsweredState')
      #@set('isAnsweredState', false)
      #Em.$('answer-visual').empty()
      @set('answer', answer)
      @set('isAnsweredState', true)
      correct = @get('correctAnswer')
      if (0+answer == correct)
        @set('message', "Right!!")
        @set('isCorrectState', true)
      else
        @set('isCorrectState', false)
        if (0+answer > correct)
          @set('message', "Too high!")
        else
          @set('message', "Too low!")
    reset: ->
      @generateEquation() if @get('isCorrectState')
      @set('isAnsweredState', false)
    #end actions

`export default EquationController`