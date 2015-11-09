'use strict'

angular.module('actegrateApp')
  .directive('discussion', ->
    templateUrl: '../views/partials/discussion.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the discussion directive'
  )
