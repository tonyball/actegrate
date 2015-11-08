'use strict'

describe 'Directive: gradedWork', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<graded-work></graded-work>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the gradedWork directive'
