'use strict'

angular.module('actegrateApp')
  .directive('usersCrudForm', ->
    templateUrl: '../views/partials/users-crud-form.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
    	return false
  )
