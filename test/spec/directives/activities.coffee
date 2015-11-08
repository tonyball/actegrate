'use strict'

describe 'Directive: activities', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<activities></activities>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the activities directive'
