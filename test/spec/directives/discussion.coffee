'use strict'

describe 'Directive: discussion', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<discussion></discussion>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the discussion directive'
