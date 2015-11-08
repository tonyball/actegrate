'use strict'

describe 'Directive: userProfile', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<user-profile></user-profile>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the userProfile directive'
