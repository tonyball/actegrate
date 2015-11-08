'use strict'

describe 'Directive: profile/discussion', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<profile/discussion></profile/discussion>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the profile/discussion directive'
