'use strict'

describe 'Directive: friendsLeaderboard', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<friends-leaderboard></friends-leaderboard>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the friendsLeaderboard directive'
