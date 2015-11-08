'use strict'

angular.module('actegrateApp')
  .directive('activities', ->
    templateUrl: '../views/partials/activities.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the activities directive'
  )
