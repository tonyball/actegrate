'use strict'

describe 'Directive: recentActivity', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<recent-activity></recent-activity>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the recentActivity directive'
