'use strict'

describe 'Directive: profile/cardsCollection', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<profile/cards-collection></profile/cards-collection>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the profile/cardsCollection directive'
