'use strict'

describe 'Directive: loginForm', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<login-form></login-form>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the loginForm directive'
