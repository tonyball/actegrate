'use strict'

angular.module('actegrateApp')
  .directive('userProfile', ->
    templateUrl: '../../views/partials/user-profile.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
    	return false
  )
