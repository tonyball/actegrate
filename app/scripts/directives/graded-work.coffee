'use strict'

angular.module('actegrateApp')
  .directive('gradedWork', ->
    templateUrl: '../../views/partials/graded-work.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the gradedWork directive'
  )
