'use strict'

describe 'Directive: imageUpload', ->

  # load the directive's module
  beforeEach module 'actegrateApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<image-upload></image-upload>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the imageUpload directive'
